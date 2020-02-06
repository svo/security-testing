#!/bin/bash

htcap crawl -v 'http://security-testing-victim.local:3000' report.db

htcap util report ./report.db ./report.html
