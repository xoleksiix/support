from rest_framework.permissions import BasePermission

from authentication.models import DEFAULT_ROLES
from core.models import Ticket


class ClientOnly(BasePermission):
    message = "Not allowed. ClientOnly."

    def has_permission(self, request, view) -> bool:
        return bool(request.user and request.user.is_authenticated and request.user.role.id == 2)


# Breakdown from anonuser request
class OperatorOnly(BasePermission):
    def has_permission(self, request, view):
        if request.user.role.id == DEFAULT_ROLES["admin"]:
            return True

        return False


class OwnerAndAssignOperatorOnly(BasePermission):
    message = "Not allowed. Owner or assign operator only."

    def has_permission(self, request, view):
        ticket_id = view.kwargs.get("ticket_id")
        ticket: Ticket = Ticket.objects.get(id=ticket_id)
        user = request.user

        if not (request.user and request.user.is_authenticated):
            return False
        if user.role.id == DEFAULT_ROLES["admin"] and ticket.operator is not None and ticket.operator.id == user.id:
            return True
        if user.role.id == DEFAULT_ROLES["user"] and ticket.client is not None and ticket.client.id == user.id:
            return True

        return False
