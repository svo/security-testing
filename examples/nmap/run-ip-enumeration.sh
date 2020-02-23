#!/bin/bash

true > report-ip-enumeration.log

nmap -sP 10.6.6.0/24 | tee report-ip-enumeration.log
