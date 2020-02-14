#!/bin/bash

true > report-tcp.log

nmap -Pn -p- 10.6.6.7 | tee report-tcp.log
