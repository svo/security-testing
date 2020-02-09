#!/bin/bash

rm -rf report*

skipfish -o report-juice-shop "http://security-testing-victim.local:3000"
