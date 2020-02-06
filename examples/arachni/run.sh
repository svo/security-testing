#!/bin/bash

sudo OPENSSL_CONF=/etc/ssl/ /usr/lib/arachni-2.0dev-1.0dev/bin/arachni "http://security-testing-victim.local:3000"  --report-save-path ./report.afr --plugin=metrics

sudo /usr/lib/arachni-2.0dev-1.0dev/bin/arachni_reporter --reporter=html:outfile=report.html.zip ./report.afr
