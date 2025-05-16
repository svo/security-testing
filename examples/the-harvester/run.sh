#!/bin/bash

mkdir -p report

theHarvester -d wikimedia.org -b duckduckgo,hunter -l 500 -f report/report.html | cat -v
