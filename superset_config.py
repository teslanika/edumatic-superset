import os

# Superset metadata database (Railway PostgreSQL)
SQLALCHEMY_DATABASE_URI = os.getenv('DATABASE_URL', '').replace('postgresql://', 'postgresql+psycopg2://')

# Secret key (set via Railway environment variable)
SECRET_KEY = os.getenv('SECRET_KEY', 'CHANGE_ME_IN_RAILWAY_VARIABLES')

# Public URL (Railway auto-provides)
PUBLIC_ROLE_LIKE_GAMMA = True

# Cache configuration (optional, using simple cache)
CACHE_CONFIG = {
    'CACHE_TYPE': 'SimpleCache',
    'CACHE_DEFAULT_TIMEOUT': 300
}

# Results backend (optional, using simple cache)
RESULTS_BACKEND = None

# Enable SQL Lab
ENABLE_TEMPLATE_PROCESSING = True

# Feature flags
FEATURE_FLAGS = {
    'ENABLE_TEMPLATE_PROCESSING': True,
    'ENABLE_EXPLORE_JSON_CSRF_PROTECTION': False,
    'ENABLE_EXPLORE_DRAG_AND_DROP': True,
}

# Roles (Gamma = read-only для студентов)
AUTH_ROLE_PUBLIC = 'Public'

# CORS settings (if needed for embedded dashboards)
ENABLE_CORS = True
CORS_OPTIONS = {
    'supports_credentials': True,
    'allow_headers': ['*'],
    'resources': ['*'],
    'origins': ['*']
}

# Row limit
ROW_LIMIT = 10000

# SQL Lab
SQLLAB_TIMEOUT = 300  # 5 minutes
SUPERSET_WEBSERVER_TIMEOUT = 300
