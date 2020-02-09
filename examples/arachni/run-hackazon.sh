#!/bin/bash

rm -rf report*

OPENSSL_CONF=/etc/ssl/ arachni "http://security-testing-victim.local:3002" --timeout=00:01:00 --report-save-path ./report-hackazon.afr --plugin=metrics --plugin=login_script:script=./login-hackazon.rb --scope-exclude-pattern="logout"

arachni_reporter --reporter=html:outfile=report-hackazon.html.zip ./report-hackazon.afr

unzip report-hackazon.html.zip -d report-hackazon
