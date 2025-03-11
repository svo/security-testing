#!/bin/bash

true > report.log

watch 'time host victim.security.com 10.6.6.8 | tee -a report.log'
