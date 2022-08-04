from django.contrib.auth import get_user_model

User = get_user_model()


def create_dev_user(*args, **kwargs):
    payload = {
        "email": "admin@admin.com",
        "username": "admin",
        "password": "admin",
        "first_name": "Admin",
        "last_name": "Adminovich",
        "age": 27,
        "phone": "0001234567",
    }

    User.objects.create_superuser(**payload)
