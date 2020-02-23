#!/bin/bash

rm stash.sqlite
theHarvester -d qual.is -b all -f report.html
