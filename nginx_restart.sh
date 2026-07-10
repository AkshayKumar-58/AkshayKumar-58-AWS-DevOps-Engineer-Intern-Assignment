#!/bin/bash

sudo systemctl restart nginx
echo "Nginx restarted at $(date)" >> /home/ubuntu/nginx_restart.log
