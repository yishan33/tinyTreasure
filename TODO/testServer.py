#!/usr/bin/python

import socket
from time import sleep

host = '192.168.1.140'
port = 8080

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect((host, port))
data = ''
client.send(data)
sleep(5)
data = 'lfs'
client.send(data)
print 'send already'
recvdata = client.recv(1024)
print recvdata
client.close()