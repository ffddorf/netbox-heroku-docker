import dj_database_url
import os
from urllib.parse import urlparse

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
