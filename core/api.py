from django.contrib.auth import get_user_model
from rest_framework import serializers
from rest_framework.decorators import api_view
from rest_framework.response import Response

from authentication.models import Role
from core.models import Ticket

User = get_user_model()


class RoleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Role
        fields = ["id"]


class UserSerializer(serializers.ModelSerializer):
    role = RoleSerializer()

    class Meta:
        model = User
        fields = [
            "id",
            "role",
            "email",
            "username",
            "first_name",
            "last_name",
            "age",
            "phone",
        ]


class TicketSerializer(serializers.ModelSerializer):
    operator = UserSerializer()
    client = UserSerializer()

    class Meta:
        model = Ticket
        fields = [
            "id",
            "operator",
            "client",
            "theme",
            "description",
            "resolved",
        ]


# class RoleLightSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Role
#         fields = ["id", "name"]


# class UserLightSerializer(serializers.ModelSerializer):
#     role = RoleLightSerializer()

#     class Meta:
#         model = User
#         fields = ["id", "username", "email", "role"]


class TicketLightSerializer(serializers.ModelSerializer):
    # operator = UserLightSerializer()
    # client = UserLightSerializer()

    class Meta:
        model = Ticket
        fields = [
            "id",
            "operator",
            "client",
            "theme",
            "resolved",
        ]


@api_view(["GET"])
def get_all_tickets(request):
    tickets = Ticket.objects.all()
    data = TicketLightSerializer(tickets, many=True).data
    return Response(data=data)


@api_view(["GET"])
def get_ticket(request, id_: int):
    tickets = Ticket.objects.get(id=id_)
    data = TicketSerializer(tickets).data
    return Response(data=data)
