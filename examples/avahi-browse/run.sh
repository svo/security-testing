#!/bin/bash

true > report.log

avahi-browse --all --resolve | tee report.log
