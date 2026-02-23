#!/bin/bash
set -e

echo "🚀 Initializing Superset..."

# Wait for database to be ready
sleep 5

# Upgrade database
superset db upgrade

# Create admin user if not exists
superset fab create-admin \
    --username admin \
    --firstname Admin \
    --lastname Edumatic \
    --email admin@edumatic.com \
    --password admin123 || echo "Admin already exists"

# Initialize Superset
superset init

echo "✅ Superset initialized!"

# Start server (Railway предоставляет PORT)
PORT=${PORT:-8088}
gunicorn \
    --bind 0.0.0.0:$PORT \
    --workers 2 \
    --timeout 300 \
    --limit-request-line 0 \
    --limit-request-field_size 0 \
    --access-logfile - \
    --error-logfile - \
    "superset.app:create_app()"
