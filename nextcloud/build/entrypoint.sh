#!/bin/sh

echo "start crond"

#set TZ
cp /usr/share/zoneinfo/${TZ} /etc/localtime && \
  echo ${TZ} > /etc/timezone

#set Cronjobs
echo "##
*/5 * * * * docker exec -i --user next nextcloud sh -c 'php -q /var/www/html/cron.php'
##" > /etc/crontabs/root

crond -f -d 8
