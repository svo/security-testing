#!/bin/bash

true > report-udp.log

sudo nmap -Pn -sU -F 10.6.6.7 | tee report-udp.log
