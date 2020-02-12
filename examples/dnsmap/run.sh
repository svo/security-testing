#!/bin/bash

true > report.log

dnsmap security.com -d 1 -w ../dictionary.txt -r report.log
