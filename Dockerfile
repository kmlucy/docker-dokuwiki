FROM webdevops/php-nginx:alpine

COPY nginx.conf /opt/docker/etc/nginx/conf.d/dokuwiki.conf
COPY setup.sh /setup.sh

RUN sed -i -e 's/v3\.5/edge/g' /etc/apk/repositories && apk upgrade --update-cache --available

RUN apk --no-cache add curl tar && \
	cd /app && \
	curl -O -L  "https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz" && \
	tar -xzf "dokuwiki-stable.tgz" --strip 1 && \
	rm "dokuwiki-stable.tgz" && \
	chown -R application:nogroup /app && \
	sed -i 's/user nginx/user application/' /opt/docker/etc/nginx/nginx.conf && \
	sed -i 's=/etc/nginx/conf.d=/opt/docker/etc/nginx/conf.d=' /opt/docker/etc/nginx/nginx.conf && \
	chmod +x /setup.sh

EXPOSE 80

VOLUME ["/app/conf","/app/data/attic","/app/data/media","/app/data/media_attic","/app/data/media_meta","/app/data/meta","/app/data/pages","/app/lib/plugins","/app/lib/tpl"]
