FROM alpine:edge
LABEL maintainer="CuCuCumin@gmail.com"
RUN set -ex; \
	sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
&& apk --update add --no-cache wget \
&& rm -rf /var/cache/apk/* /tmp/* /var/tmp \
&& mkdir /etc/overture

WORKDIR /etc/overture
VOLUME /etc/overture

COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 53 53/udp

CMD ["overture", "-c", "/etc/overture/config.json", "-v"]