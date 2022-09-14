from django.urls import path

from core.api import (
    CommentsCreateAPI,
    CommentsListAPI,
    TicketAssingAPI,
    TicketResolveAPI,
    TicketRetrieveAPI,
    TicketsAPI,
)

tickets_urls = [
    path("", TicketsAPI.as_view()),
    path("<int:id>/", TicketRetrieveAPI.as_view()),
    path("<int:id>/assing/", TicketAssingAPI.as_view()),
    path("<int:id>/resolve/", TicketResolveAPI.as_view()),
]

comments_urls = [
    path("<int:ticket_id>/comments/", CommentsListAPI.as_view()),
    path("<int:ticket_id>/comments/create/", CommentsCreateAPI.as_view()),
]

urlpatterns = tickets_urls + comments_urls
