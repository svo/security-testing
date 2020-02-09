#!/bin/bash

rm -rf report*

skipfish -o report-hackazon --auth-form http://security-testing-victim.local:3002/ --auth-user test_user --auth-pass 123456 --auth-verify-url http://security-testing-victim.local:3002/account "http://security-testing-victim.local:3002"
