#!/usr/bin/python

from biplist import *
from pexpect import *
from time import sleep

PlistName = 'setting.plist'
plist = readPlist(PlistName)

def process(theType, commond):
	if theType in ['Commond', 'Open']:
		commandStr = plist[theType][commond]
		if theType == 'Open':
			pre = 'open '
		else :
			pre = ''
		print pre + commandStr
		print run(pre + commandStr)
		
		
	else:
		print 'Undefind Commond'
	

		
		