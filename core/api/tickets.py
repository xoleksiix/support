from django.core.exceptions import SuspiciousOperation
from django.db.models import Q
from rest_framework.generics import (
    ListCreateAPIView,
    RetrieveUpdateDestroyAPIView,
    UpdateAPIView,
)
from rest_framework.response import Response

from authentication.models import DEFAULT_ROLES
from core.models import Ticket
from core.permissions import ClientOnly, OperatorOnly
from core.serializers import (
    TicketAssingSerializer,
    TicketLightSerializer,
    TicketSerializer,
)
from core.services import TicketsCRUD


class TicketsAPI(ListCreateAPIView):
    def get_serializer_class(self):
        if self.request.method == "POST":
            self.serializer_class = TicketSerializer
        if self.request.method == "GET":
            self.serializer_class = TicketLightSerializer
        return super().get_serializer_class()

    def get_permissions(self):
        if self.request.method == "POST":
            self.permission_classes = [ClientOnly]
        return super().get_permissions()

    def get_queryset(self):
        user = self.request.user
        empty = self.request.GET.get("empty", None)

        if user.role.id == DEFAULT_ROLES["admin"]:
            if empty == "true":
                return Ticket.objects.filter(operator=None)
            if empty == "false":
                return Ticket.objects.filter(operator=user)
            if empty is not None:
                raise SuspiciousOperation("Not allowed value. Only 'true' or 'false', only lowercase.")
            return Ticket.objects.filter(Q(operator=None) | Q(operator=user))

        if empty is not None:
            raise SuspiciousOperation("Not allowed. Operators only.")

        return Ticket.objects.filter(client=user)


class TicketRetrieveAPI(RetrieveUpdateDestroyAPIView):
    serializer_class = TicketSerializer
    lookup_field = "id"
    lookup_url_kwarg = "id"
    # permission_classes = [ClientOnly]

    def get_queryset(self):
        user = self.request.user
        if user.role.id == DEFAULT_ROLES["user"]:
            return Ticket.objects.filter(client=user)
        return Ticket.objects.filter(operator=user)


class TicketAssingAPI(UpdateAPIView):
    http_method_names = ["patch"]
    serializer_class = TicketAssingSerializer
    permission_classes = [OperatorOnly]
    lookup_field = "id"
    lookup_url_kwarg = "id"

    def get_queryset(self):
        return Ticket.objects.filter(operator=None)


class TicketResolveAPI(UpdateAPIView):
    http_method_names = ["patch"]
    permission_classes = [OperatorOnly]
    serializer_class = TicketLightSerializer
    lookup_field = "id"
    lookup_url_kwarg = "id"

    def get_queryset(self):
        user = self.request.user
        return Ticket.objects.filter(operator=user)

    def update(self, request, *args, **kwargs):
        instance = self.get_object()
        instance = TicketsCRUD.change_resolved_status(instance)

        serializer = self.get_serializer(instance)
        # serializer = self.serializer_class(instance)

        return Response(serializer.data)
