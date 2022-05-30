# pinned to specific release
ARG NETBOX_VERSION=v3.1.11
FROM netboxcommunity/netbox:${NETBOX_VERSION} AS base

COPY requirements.txt /opt/netbox-heroku/requirements.txt
RUN /opt/netbox/venv/bin/pip install -r /opt/netbox-heroku/requirements.txt
COPY configuration.heroku.py /etc/netbox/config/

FROM base AS release

COPY release.sh /opt/netbox-heroku/
RUN chmod +x /opt/netbox-heroku/release.sh

# for some reason, the release process does not like our usual entrypoint
ENTRYPOINT [ "/bin/sh", "-c" ]
CMD [ "/opt/netbox-heroku/release.sh" ]

FROM base AS patcher

RUN apk add jq
RUN cat /etc/unit/nginx-unit.json | jq '.routes |= [{match: {uri: "/api/docs/", arguments:{format: "openapi"}}, action: {return: 301, location: "/static/openapi.json"}}] + .' > /etc/unit/nginx-unit.json

FROM base AS web

COPY entrypoint.sh web.sh worker.sh /opt/netbox-heroku/
RUN chmod +x /opt/netbox-heroku/*.sh

COPY --from=patcher /etc/unit/nginx-unit.json /etc/unit/nginx-unit.json

ENTRYPOINT [ "/opt/netbox-heroku/entrypoint.sh" ]
CMD [ "/opt/netbox-heroku/web.sh" ]
