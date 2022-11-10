FROM webdevops/php-nginx:8.0-alpine
LABEL maintainer "Kyle Lucy <kmlucy@gmail.com>"

COPY nginx.conf /opt/docker/etc/nginx/conf.d/dokuwiki.conf
COPY setup.sh /setup.sh
COPY update_lib.sh /update_lib.sh

RUN apk --no-cache add curl tar && \
	cd /app && \
	curl -O -L  "https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz" && \
	tar -xzf "dokuwiki-stable.tgz" --strip 1 && \
	rm "dokuwiki-stable.tgz" && \
	chown -R application:nogroup /app && \
	chown -R application:nogroup /var/lib/nginx && \
	sed -i 's/user nginx/user application/' /opt/docker/etc/nginx/nginx.conf && \
	sed -i 's=/etc/nginx/conf.d=/opt/docker/etc/nginx/conf.d=' /opt/docker/etc/nginx/nginx.conf && \
	chmod +x /setup.sh /update_lib.sh && \
	mkdir -p /tmp/dokuwiki/plugins && \
	mkdir -p /tmp/dokuwiki/tpl && \
	rsync -aE /app/lib/plugins/ /tmp/dokuwiki/plugins/ && \
	rsync -aE /app/lib/tpl/ /tmp/dokuwiki/tpl/ && \
	sed -i 's=runEntrypoints "$@"=/update_lib.sh\n&=' /entrypoint

EXPOSE 80

VOLUME ["/app/conf","/app/data","/app/lib/plugins","/app/lib/tpl"]
