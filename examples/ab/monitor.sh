#!/bin/bash

true > report.log

while true; do
  curl -I --silent --head -o /dev/null -w "%{http_code} - %{time_total}\n" "http://security-testing-victim.local:3000" 2>&1 | tee -a report.log
done
