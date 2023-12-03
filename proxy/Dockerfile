FROM alpine:3.18

RUN    wget -O /etc/apk/keys/whosgonna_`uname -m`.rsa.pub https://packagecloud.io/whosgonna/`uname -m`/rsakey \
    && echo "https://packagecloud.io/whosgonna/`uname -m`/alpine/v3.18/main" >> /etc/apk/repositories \
    && echo '/builder/packages/kamailio/' >> /etc/apk/repositories \
    && apk add --no-cache kamailio kamailio-mysql kamailio-extras \
                          kamailio-debugger sngrep sipp

COPY ./kamailio.cfg /etc/kamailio/kamailio.cfg

ENTRYPOINT ["kamailio", "-ddDDeE", "-u", "kamailio", "-g", "kamailio"]

