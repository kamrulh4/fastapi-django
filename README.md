# FastAPI with Django ORM

## Overview

This is a modern template repository for implementing a server using Django for the Admin and ORM (Async supported) and FastAPI for the API layer.

**Tech Stack:**
- **Python**: 3.13
- **FastAPI**: Latest
- **Django**: 5.x (Latest stable with Async Support)
- **Database**: PostgreSQL 17 (Alpine)
- **Containerization**: Docker & Docker Compose

## Prerequisites

- Docker
- Docker Compose

## Development

1. **Clone this repository**

   ```sh
   git clone https://github.com/kathmandu777/fastapi-django-template.git
   ```

2. **Create Environment File**

   Create `fastapi/fastapi.env` by copying the template:
   ```sh
   cp fastapi/fastapi.env.tmpl fastapi/fastapi.env
   ```
   (Or manually create it based on `fastapi.env.tmpl`)

3. **Start the Application**

   Run with Docker Compose. This will build the images and start the services.
   
   > **Note:** The startup script automatically runs migrations and collects static files.

   ```sh
   docker-compose up --build
   ```

   - **FastAPI Documentation**: http://localhost:8000/docs
   - **Django Admin**: http://localhost:8001/admin

## Management Commands

To run management commands (like creating a superuser), you can use `docker-compose run`.

**Create Superuser:**

```sh
docker-compose run --rm fastapi python manage.py createsuperuser
```

**Make Migrations (if you change models):**

```sh
docker-compose run --rm fastapi python manage.py makemigrations
```

**Run Migrations manually:**

```sh
docker-compose run --rm fastapi python manage.py migrate
```

## Structure

- `fastapi/`: Application code
  - `app/`: FastAPI application and routers
  - `config/`: Configuration settings (Django & FastAPI)
  - `requirements.txt`: Python dependencies
  - `Dockerfile`: Multi-stage Docker build
- `docker-compose.yml`: Service orchestration
