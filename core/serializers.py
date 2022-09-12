from itertools import chain

from django.contrib.auth import get_user_model
from django.core.exceptions import ValidationError
from rest_framework import serializers

from authentication.models import Role
from core.models import Ticket

User = get_user_model()


class RoleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Role
        exclude = [
            "created_at",
            "updated_at",
        ]


class UserSerializer(serializers.ModelSerializer):
    role = RoleSerializer()

    class Meta:
        model = User
        exclude = [
            "password",
            "last_login",
            "updated_at",
            "is_active",
            "is_staff",
            "is_superuser",
            "created_at",
            "groups",
            "user_permissions",
        ]


class TicketSerializer(serializers.ModelSerializer):
    operator = UserSerializer(read_only=True)
    client = UserSerializer(read_only=True)

    class Meta:
        model = Ticket
        fields = "__all__"

    def validate(self, attrs: dict) -> dict:
        theme = attrs.get("theme")

        if not theme:
            return attrs

        # try:
        #     Ticket.objects.get(theme=theme)
        # except Ticket.DoesNotExist:
        #     return attrs

        # data = Ticket.objects.filter(...).filter(...).get().values()
        # data = Ticket.objects.only("theme")
        data = Ticket.objects.values_list("theme")

        for element in chain.from_iterable(data):
            if element == theme:
                raise ValidationError("This ticket is already in the database")

        attrs["client"] = self.context["request"].user
        return attrs


class TicketLightSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ticket
        fields = [
            "id",
            "operator",
            "client",
            "theme",
            "resolved",
        ]


class TicketAssingSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ticket
        fields = ["operator"]

    def validate(self, attrs):
        # NOTE: Add current user to the "attrs" object
        attrs["operator"] = self.context["request"].user
        return attrs
