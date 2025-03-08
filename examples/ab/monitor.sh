#!/bin/bash

true > report.log

while true; do
  curl -I --silent --head -o /dev/null -w "%{http_code} - %{time_total}\n" "http://10.6.6.9:3000" 2>&1 | tee -a report.log
done
