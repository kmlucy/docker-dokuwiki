FROM webdevops/php-nginx:alpine-php7
LABEL maintainer "Kyle Lucy <kmlucy@gmail.com>"

COPY nginx.conf /opt/docker/etc/nginx/conf.d/dokuwiki.conf
COPY setup.sh /setup.sh

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

VOLUME ["/app/conf","/app/data","/app/lib/plugins","/app/lib/tpl"]
