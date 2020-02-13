#!/bin/bash

true > report.xml

dnsrecon -d security.com -D /vagrant/examples/dictionary.txt -t brt --xml $(pwd)/report.xml
