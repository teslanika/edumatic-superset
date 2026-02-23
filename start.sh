#!/bin/bash
set -e

echo "🚀 Initializing Superset..."

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

# Start server
gunicorn \
    --bind 0.0.0.0:8088 \
    --workers 4 \
    --timeout 300 \
    --limit-request-line 0 \
    --limit-request-field_size 0 \
    "superset.app:create_app()"
