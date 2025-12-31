#!/bin/bash
# Create necessary directories
mkdir -p static media

# Run migrations and collect static files
python manage.py makemigrations
python manage.py migrate
python manage.py collectstatic --noinput

uvicorn config.asgi:fastapi_app --reload --host 0.0.0.0 --port 8000 &
uvicorn config.asgi:django_app --reload --host 0.0.0.0 --port 8001
