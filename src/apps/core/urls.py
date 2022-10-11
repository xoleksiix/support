from django.urls import path

from apps.core.api import (
    CommentsCreateAPI,
    CommentsListAPI,
    TicketAssignAPI,
    TicketResolveAPI,
    TicketRetrieveAPI,
    TicketsAPI,
)

tickets_urls = [
    path("", TicketsAPI.as_view()),
    path("<int:id>/", TicketRetrieveAPI.as_view()),
    path("<int:id>/assign/", TicketAssignAPI.as_view()),
    path("<int:id>/resolve/", TicketResolveAPI.as_view()),
]

comments_urls = [
    path("<int:ticket_id>/comments/", CommentsListAPI.as_view()),
    path("<int:ticket_id>/comments/create/", CommentsCreateAPI.as_view()),
]

urlpatterns = tickets_urls + comments_urls
