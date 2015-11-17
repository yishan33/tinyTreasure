#!/usr/bin/python


import socket
import select


port = 1111
index = 1
serverSocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
serverSocket.bind(('192.168.1.158', port))
serverSocket.listen(10)
print 'server is working...'
while True:

    client, addr = serverSocket.accept()
    print 'already have client------------'
    while True:
        data = client.recv(1024)
        print data, index
        if not data:
            print 'nill'
        # client.close(
        backData = 'back % i/r/n/r/n' % index
        client.send(backData)
        index += 1

#   else :
#       print data
#   if data == '':
#       print 'connect'
#   else :
#       print data
#   client.send(backData)

print 'log out'
