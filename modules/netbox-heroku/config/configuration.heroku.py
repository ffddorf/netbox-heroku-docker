import dj_database_url
import os
from urllib.parse import urlparse
from google.oauth2 import service_account
import json
from datetime import timedelta

# configure postgres connection
DATABASE = dj_database_url.config(ssl_require=True)

# configure redis connection
REDIS_URL = urlparse(os.environ.get("REDIS_URL"))
REDIS_BASE = {
    'HOST': REDIS_URL.hostname,
    'PORT': REDIS_URL.port,
    'PASSWORD': REDIS_URL.password,
    'SSL': False,
}
REDIS = {
    'tasks': {
        **REDIS_BASE,
        'DATABASE': 0,
    },
    'caching': {
        **REDIS_BASE,
        'DATABASE': 1,
    },
}

# configure asset storage
STORAGE_BACKEND = 'storages.backends.gcloud.GoogleCloudStorage'
service_account_info = json.loads(os.environ.get('GOOGLE_SERVICE_ACCOUNT'))
STORAGE_CONFIG = {
    'GS_BUCKET_NAME': os.environ.get('ASSETS_GCS_BUCKET_NAME'),
    'GS_CREDENTIALS': service_account.Credentials.from_service_account_info(service_account_info),
    'GS_DEFAULT_ACL': None,  # uses bucket ACL, will sign URLs
    'GS_FILE_OVERWRITE': False,
    'GS_EXPIRATION': timedelta(seconds=3600),
}

PLUGINS = [
    'netbox_secretstore',
    'netbox_secrets',
]
