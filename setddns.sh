#!/bin/bash

# cp /tmp/custom.scripts/runddns.sh /etc/cron.hourly/
# chmod +x /etc/cron.hourly/runddns.sh

crontab -l > /tmp/cron.tmp
echo "*/10 * * * * bash /tmp/custom.scripts/onetimeddns.sh" >> /tmp/cron.tmp
crontab /tmp/cron.tmp

fn_log " end..."
