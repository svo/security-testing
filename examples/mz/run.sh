#!/bin/bash

sudo /usr/sbin/mz -A rand -B 10.6.6.7 -t dns "q=security.com" -c 10000000
