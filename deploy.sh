#!/bin/bash

ssh server "
    rm /etc/nginx/conf.d/.utile.bak
    mv /etc/nginx/conf.d/utile.conf /etc/nginx/conf.d/.utile.bak
"
scp utile.conf server:/etc/nginx/conf.d/utile.conf
(ssh server "nginx -t && service nginx reload" && echo "Deployed") || echo "Not deployed!"
