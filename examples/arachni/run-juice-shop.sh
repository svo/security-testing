#!/bin/bash

rm -rf report*

OPENSSL_CONF=/etc/ssl/ arachni "http://security-testing-victim.local:3000" --timeout=00:01:00 --report-save-path ./report-juice-shop.afr --plugin=metrics

arachni_reporter --reporter=html:outfile=report-juice-shop.html.zip ./report-juice-shop.afr

unzip report-juice-shop.html.zip -d report-juice-shop
