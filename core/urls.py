from django.urls import path

from core.api import TicketRetrieveAPI, TicketsAPI

urlpatterns = [
    path("", TicketsAPI.as_view()),
    path("<int:id>/", TicketRetrieveAPI.as_view()),
]
