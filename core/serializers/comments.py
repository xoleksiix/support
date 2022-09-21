from django.core.exceptions import ValidationError
from rest_framework import serializers

from core.models import Comment, Ticket


class CommentSerializer(serializers.ModelSerializer):
    # ticket = serializers.PrimaryKeyRelatedField(read_only=True)
    # user = serializers.PrimaryKeyRelatedField(read_only=True)
    # prev_comment = serializers.IntegerField(read_only=True, allow_null=True)
    class Meta:
        model = Comment
        fields = "__all__"
        read_only_fields = ["ticket", "user", "prev_comment"]

    def validate(self, attrs):
        request = self.context["request"]
        ticket_id: int = request.parser_context["kwargs"]["ticket_id"]
        ticket: Ticket = Ticket.objects.get(id=ticket_id)

        if ticket.resolved:
            raise ValidationError("Ticket are resolved. Comment non-allowed.")
        if ticket.operator is None:
            raise ValidationError("You cannot comment non-assigned ticket.")

        attrs["ticket"] = ticket
        attrs["user"] = request.user

        last_comment: Comment | None = ticket.comments.last()

        attrs["prev_comment"] = last_comment if last_comment else None

        return attrs

    def create(self, validated_data):
        instance = Comment.objects.create(**validated_data)
        return instance
