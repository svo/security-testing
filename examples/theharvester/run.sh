#!/bin/bash

rm stash.sqlite
theHarvester -d myob.com -b linkedin -f report.html
