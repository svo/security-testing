#!/bin/bash

sudo mausezahn -A rand -B 10.6.6.8 -t dns "q=security.com" -c 100000
