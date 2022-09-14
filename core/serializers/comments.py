from rest_framework import serializers

from core.models import Comment, Ticket


class CommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comment
        fields = "__all__"
        read_only_fields = ["ticket"]

    def validate(self, attrs):
        ticket_id = self.context["request"].parser_context.get("kwargs").get("ticket_id")
        attrs["ticket"] = Ticket.objects.get(id=ticket_id)

        attrs["user"] = self.context["request"].user

        return attrs
