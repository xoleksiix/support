from rest_framework.permissions import BasePermission


class ClientOnly(BasePermission):
    message = "Not allowed. ClientOnly."

    def has_permission(self, request, view) -> bool:
        return bool(request.user and request.user.is_authenticated and request.user.role.id == 2)
