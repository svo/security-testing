#!/bin/bash

sudo spiderfoot -s qual.is -o json | tee report.json
