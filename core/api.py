from rest_framework.generics import (
    CreateAPIView,
    ListAPIView,
    RetrieveUpdateDestroyAPIView,
)
from rest_framework.permissions import IsAuthenticated

from core.models import Ticket
from core.serializers import TicketLightSerializer, TicketSerializer


class TicketsListAPI(ListAPIView):
    serializer_class = TicketLightSerializer

    def get_queryset(self):
        user = self.request.user

        if user.role.id == 1:
            return Ticket.objects.all()

        return Ticket.objects.filter(client=user)


class TicketsCreateAPI(CreateAPIView):
    serializer_class = TicketSerializer
    queryset = Ticket.objects.all()
    permission_classes = [IsAuthenticated]


class TicketsAPI(TicketsListAPI, TicketsCreateAPI):
    queryset = Ticket.objects.all()


class TicketRetrieveAPI(RetrieveUpdateDestroyAPIView):
    queryset = Ticket.objects.all()
    serializer_class = TicketSerializer
    lookup_field = "id"
    lookup_url_kwarg = "id"


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
