FROM alpine:edge
LABEL maintainer="CuCuCumin@gmail.com"
RUN set -ex; \
	sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
&& apk --update add --no-cache wget \
&& wget -c https://glare.now.sh/shawn1m/overture/overture-linux-amd64 -O /tmp/overture.zip \
&& cd /tmp && unzip overture.zip && mv overture-linux-amd64 /usr/local/bin/overture \
&& rm -rf /var/cache/apk/* /tmp/* /var/tmp \
&& mkdir /etc/overture

WORKDIR /etc/overture
VOLUME /etc/overture

EXPOSE 53 53/udp

CMD ["overture", "-c", "/etc/overture/config.json", "-v"]