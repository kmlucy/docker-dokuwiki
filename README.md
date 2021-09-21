# docker-dokuwiki

First time setup:
```
docker run -d \
  --name=dokuwiki \
  -v /etc/localtime:/etc/locatime:ro \
  -v /opt/dokuwiki/conf:/app/conf \
  -v /opt/dokuwiki/data:/app/data \
  -v /opt/dokuwiki/lib/plugins:/app/lib/plugins \
  -v /opt/dokuwiki/lib/tpl:/app/lib/tpl \
  -p 8000:80 \
  ghcr.io/kmlucy/docker-dokuwiki /setup.sh
```
Then navigate to http://ip-addr:8000/install.php. Go through the install wizard until you get the `Continue to your new DokuWiki` message. You can then stop and remove the container:
```
docker stop dokuwiki && docker rm dokuwiki
```

Once your DokuWiki is setup, you can run it with:
```
docker run -d \
  --name=dokuwiki \
  -v /etc/localtime:/etc/locatime:ro \
  -v /opt/dokuwiki/conf:/app/conf \
  -v /opt/dokuwiki/data:/app/data \
  -v /opt/dokuwiki/lib/plugins:/app/lib/plugins \
  -v /opt/dokuwiki/lib/tpl:/app/lib/tpl \
  -p 8000:80 \
  ghcr.io/kmlucy/docker-dokuwiki
```

Based on [webdevops/php-nginx](https://github.com/webdevops/Dockerfile)
