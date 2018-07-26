#!/bin/bash

# Update Plugins
rm -fv /app/lib/plugins/*
comm -13 <(find /app/lib/plugins/ -maxdepth 1 -mindepth 1 -type d -print | sed 's=app/lib=tmp/dokuwiki=' | sort -d) <(find /tmp/dokuwiki/plugins/ -maxdepth 1 -mindepth 1 -type d -print | sort -d) | xargs rm -rfv
comm -12 <(find /app/lib/plugins/ -maxdepth 1 -mindepth 1 -type d -print | sort -d) <(find /tmp/dokuwiki/plugins/ -maxdepth 1 -mindepth 1 -type d -print | sed 's=tmp/dokuwiki=app/lib=' | sort -d) | xargs rm -rfv
cp -r /tmp/dokuwiki/plugins/* /app/lib/plugins/

# Update Templates
rm -fv /app/lib/tpl/*
comm -13 <(find /app/lib/tpl/ -maxdepth 1 -mindepth 1 -type d -print | sed 's=app/lib=tmp/dokuwiki=' | sort -d) <(find /tmp/dokuwiki/tpl/ -maxdepth 1 -mindepth 1 -type d -print | sort -d) | xargs rm -rfv
comm -12 <(find /app/lib/tpl/ -maxdepth 1 -mindepth 1 -type d -print | sort -d) <(find /tmp/dokuwiki/tpl/ -maxdepth 1 -mindepth 1 -type d -print | sed 's=tmp/dokuwiki=app/lib=' | sort -d) | xargs rm -rfv
cp -r /tmp/dokuwiki/tpl/* /app/lib/tpl/

# Clean Up
rm -rf /tmp/dokuwiki
