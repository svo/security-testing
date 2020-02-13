#!/bin/bash

true > report.log

dnsmap security.com -d 100 -w ../dictionary.txt -r report.log
