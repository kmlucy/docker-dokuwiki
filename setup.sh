#!/bin/bash

# download and extract files
cd /app
curl -O -L  "https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz"
tar -xzf "dokuwiki-stable.tgz" --strip 1 --skip-old-files
rm "dokuwiki-stable.tgz"
chown -R application:nogroup /app

# allow access to install.php
sed -i 's/|install.php//' /opt/docker/etc/nginx/conf.d/dokuwiki.conf

# start services
/entrypoint supervisord
