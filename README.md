# Security Testing

## Summary

This document is a high level introduction to some security testing tools that are commonly available in the linux ecosystem.

## Vagrant Environment

1. [Ansible (2.9.4)](https://www.ansible.com/)
2. [Vagrant (2.2.6)](https://www.vagrantup.com/)
3. [VirtualBox (6.0.16 r135674)](https://www.virtualbox.org/)

### Running

1. `vagrant up --no-parallel`
2. `vagrant ssh`

### Victim

#### Services

* Juice Shop
  * http://172.17.0.1.local:3000/
* WebGoat
  * http://172.17.0.1.local:3001/WebGoat/
* Hackazon
  * HTTP: http://172.17.0.1.local:3002/
  * HTTPS: https://172.17.0.1.local:3003/
* dnsmasq
  * 8080
  * 53

## Attack Vectors

### Network

#### Domain Name Discovery

##### dnsmap

```
dnsmap <domain.com> -d 1 -w <dictionary> -r dnsmap-$(date +%F).log
```

##### DNSRecon

```
dnsrecon -d example.com -D <dictionary> -t brt --xml $(pwd)/dnsrecon.xml
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
sudo nmap -Pn -sU -F <xxx.xxx.xxx.xxx>
```

#### IP Enumeration

```
nmap -sP <xxx.xxx.xxx.xxx/24>
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
dig @<xxx.xxx.xxx.xxx> domain.com
```

##### mz

```
sudo /usr/sbin/mz -A rand -B <xxx.xxx.xxx.xxx> -t dns "q=<domain.com>" -c 10000000
```

### Man In The Middle

```
mitmproxy -R https://some.domain.com:<port>/
```

### Harvesting

#### theHarvester

```
theHarvester -d domain.com -b all -f $(date +%F).html
```

### Security Reconnaissance

#### Arachni

```
sudo OPENSSL_CONF=/etc/ssl/ /usr/lib/arachni-2.0dev-1.0dev/bin/arachni "http://some.domain.com" --report-save-path ./$(date +%F).afr --plugin=metrics
```

##### Generate Report

```
sudo /usr/lib/arachni-2.0dev-1.0dev/bin/arachni_reporter --reporter=html:outfile=$(date +%F).html.zip ./$(date +%F).afr
```

#### HTCAP

```
htcap crawl -v 'http://some.domain.com/' $(date +%F).db
```

##### Generate Report

```
htcap util report ./$(date +%F).db ./$(date +%F).html
```

#### Wapiti

```
wapiti 'http://some.domain.com/' --output $(date +%F)
```
