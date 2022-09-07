from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView
from rest_framework.permissions import IsAuthenticated

from core.models import Ticket
from core.serializers import TicketLightSerializer, TicketSerializer


class TicketsAPI(ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    queryset = Ticket.objects.all()

    def get_serializer_class(self):
        if self.request.method == "POST":
            self.serializer_class = TicketSerializer
        if self.request.method == "GET":
            self.serializer_class = TicketLightSerializer
        return super().get_serializer_class()

    def get_queryset(self):
        user = self.request.user

        if user.role.id == 1:
            return Ticket.objects.filter(operator=None) | Ticket.objects.filter(operator=user)

        return Ticket.objects.filter(client=user)


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
