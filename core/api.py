from django.core.exceptions import SuspiciousOperation
from django.db.models import Q
from rest_framework.generics import (
    ListCreateAPIView,
    RetrieveUpdateDestroyAPIView,
    UpdateAPIView,
)

from authentication.models import DEFAULT_ROLES
from core.models import Ticket
from core.permissions import ClientOnly, OperatorOnly
from core.serializers import (
    TicketAssingSerializer,
    TicketLightSerializer,
    TicketSerializer,
)


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


# class TicketsListCreateAPI(ListCreateAPIView):
#     serializer_class = TicketLightSerializer
#     queryset = Ticket.objects.all()
#     permission_classes = [IsAuthenticated]

#     def get_permissions(self):
#         if self.request.method == "POST":
#             return [IsAuthenticated()]
#         return []

#     def get_serializer(self, *args, **kwargs):
#         return TicketLightSerializer if self.request.method == "GET" else TicketSerializer
# @api_view(["GET", "POST"])
# def get_post_tickets(request):
#     if request.method == "GET":
#         tickets = Ticket.objects.all()
#         data = TicketLightSerializer(tickets, many=True).data
#         return Response(data=data)

#     serializer = TicketSerializer(data=request.data)
#     serializer.is_valid(raise_exception=True)

#     instance: Ticket = serializer.create(serializer.validated_data)
#     results = TicketSerializer(instance).data

#     return Response(data=results, status=status.HTTP_201_CREATED)


# @api_view(["GET", "PUT", "DELETE"])
# def retrieve_update_delete_ticket(request, id_: int):
#     instance: Ticket = Ticket.objects.get(id=id_)

#     if request.method == "DELETE":
#         instance.delete()
#         return Response(status=status.HTTP_204_NO_CONTENT)

#     elif request.method == "PUT":
#         serializer = TicketSerializer(data=request.data)
#         serializer.is_valid(raise_exception=True)

#         updated_instance = serializer.update(instance, serializer.validated_data)
#         results = TicketSerializer(updated_instance).data
#         return Response(data=results, status=status.HTTP_200_OK)

#     else:
#         data = TicketSerializer(instance).data
#         return Response(data=data, status=status.HTTP_200_OK)
