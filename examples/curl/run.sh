#!/bin/bash

true > report-scraping-target.log

for i in {1..500}; do
  curl -I --silent --head -o /dev/null -w "%{http_code} - product ${i}\n" "http://172.17.0.1:3002/product/view?id=${i}" 2>&1 | tee -a report-scraping-target.log
done
