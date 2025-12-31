# Stage 1: Builder
FROM python:3.13-alpine as builder

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install build dependencies
# - build-base: gcc, make, etc.
# - libffi-dev: for older python-jose/cffi if needed
# - postgresql-dev: for psycopg
# - zlib-dev, jpeg-dev: for Pillow
RUN apk add --no-cache \
    build-base \
    libffi-dev \
    postgresql-dev \
    zlib-dev \
    jpeg-dev

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Stage 2: Final
FROM python:3.13-alpine

WORKDIR /src

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=/src
ENV PATH="/opt/venv/bin:$PATH"

# Install runtime dependencies
# - libpq: for psycopg
# - libjpeg: for Pillow
RUN apk add --no-cache \
    libpq \
    libjpeg \
    bash \
    less

COPY --from=builder /opt/venv /opt/venv
COPY . /src/

# Create necessary directories
RUN mkdir -p static media
