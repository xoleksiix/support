FROM python:3.10-slim

# Change work directory
WORKDIR /app/

# Copy project files 
COPY . .

# Install deps
RUN pip install pipenv \
    && pipenv install --system --deploy --ignore-pipfile --dev

# CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]
CMD sleep 3 \
    && python manage.py migrate \
    && python manage.py runserver 0.0.0.0:80

