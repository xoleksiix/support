from rest_framework.permissions import BasePermission

from authentication.models import DEFAULT_ROLES


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
