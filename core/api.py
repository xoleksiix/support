from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response

from core.models import Ticket
from core.serializers import TicketLightSerializer, TicketSerializer


@api_view(["GET", "POST"])
def get_post_tickets(request):
    if request.method == "GET":
        tickets = Ticket.objects.all()
        data = TicketLightSerializer(tickets, many=True).data
        return Response(data=data)

    serializer = TicketSerializer(data=request.data)
    serializer.is_valid(raise_exception=True)

    # ticket = Ticket.objects.create(**serializer.validated_data)
    instance = serializer.create(serializer.validated_data)
    results = TicketSerializer(instance).data

    return Response(data=results, status=status.HTTP_201_CREATED)


@api_view(["GET", "PUT", "DELETE"])
def retrieve_update_delete_ticket(request, id_: int):
    instance = Ticket.objects.get(id=id_)

    if request.method == "DELETE":
        instance.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

    elif request.method == "PUT":
        serializer = TicketSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        updated_instance = serializer.update(instance, serializer.validated_data)
        results = TicketSerializer(updated_instance).data
        return Response(data=results, status=status.HTTP_200_OK)

    else:
        data = TicketSerializer(instance).data
        return Response(data=data, status=status.HTTP_200_OK)
