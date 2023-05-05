# pinned to specific release
ARG NETBOX_VERSION=v3.4.8
FROM ghcr.io/netbox-community/netbox:${NETBOX_VERSION} AS base

COPY requirements.txt /opt/netbox-heroku/requirements.txt
RUN apt-get update && apt-get install -qy \
  gcc \
  libc-dev \
  git-core \
  && rm -rf /var/lib/apt/lists/*
RUN /opt/netbox/venv/bin/pip install -r /opt/netbox-heroku/requirements.txt
COPY configuration.heroku.py /etc/netbox/config/

FROM base AS release

COPY release.sh /opt/netbox-heroku/
RUN chmod +x /opt/netbox-heroku/release.sh

# for some reason, the release process does not like our usual entrypoint
ENTRYPOINT [ "/bin/sh", "-c" ]
CMD [ "/opt/netbox-heroku/release.sh" ]

FROM base AS web

COPY entrypoint.sh web.sh worker.sh /opt/netbox-heroku/
RUN chmod +x /opt/netbox-heroku/*.sh

ENTRYPOINT [ "/opt/netbox-heroku/entrypoint.sh" ]
CMD [ "/opt/netbox-heroku/web.sh" ]
