#! /bin/sh


arp  -a  | grep android
nmap -sP 192.168.1.0/24
#nmap -sP 192.168.1.0/24 | grep ILO
# sudo nmap -sS 192.168.1.152

#nmap -sP