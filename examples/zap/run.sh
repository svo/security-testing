#!/bin/bash

mkdir -p report &&

export ZAP_PATH=/opt/zaproxy &&
export ZAP_LOG_PATH=$(pwd)/report &&

zap-cli --verbose quick-scan -s xss,sqli --spider -r http://10.6.6.9:3000 &&

zap-cli report -o report/juice-shop-report.html -f html
