# docker-dokuwiki

To run:
```
docker run -d \
  --name=dokuwiki \
  -v /etc/localtime:/etc/locatime:ro \
  -v /opt/dokuwiki/conf:/app/conf \
  -v /opt/dokuwiki/data/attic:/app/data/attic \
  -v /opt/dokuwiki/data/media:/app/data/media \
  -v /opt/dokuwiki/data/media_attic:/app/data/media_attic \
  -v /opt/dokuwiki/data/media_meta:/app/data/media_meta \
  -v /opt/dokuwiki/data/meta:/app/data/meta \
  -v /opt/dokuwiki/data/pages:/app/data/pages \
  -v /opt/dokuwiki/lib/plugins:/app/lib/plugins \
  -v /opt/dokuwiki/lib/tpl:/app/lib/tpl \
  -p 8000:80 \
  kmlucy/docker-dokuwiki
```

Based on [webdevops/php-nginx](https://github.com/webdevops/Dockerfile)
