#!/bin/bash

true > report.log

while true; do
  curl -I --silent --head -o /dev/null -w "%{http_code} - %{time_total}\n" "https://on.life" 2>&1 | tee -a report.log
done
