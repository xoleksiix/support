from django.contrib import admin
from django.urls import path

urlpatterns = [
    path("admin/", admin.site.urls),
    #path("home/", home),
    # Exchange rates
    #path("btc_usd/", btc_usd),
    #path("history/", history),
    # Tickets
    #path("tickets/", get_all_tickets),
]
