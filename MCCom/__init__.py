#-*- coding:utf-8 -*-
#!/usr/bin/python

import os, sys
import mailHelper
import TermialOperator
import time



class MCC(object):
	
	def __init__(self):
		self.mailHelper = mailHelper.mailHelper()
		self.operator = TermialOperator
		self.toRun()
		
	def toRun(self):
		while True:
			self.mailHelper = mailHelper.mailHelper()
			self.run()
			time.sleep(10)
			
	def run(self):
		mailBody = self.mailHelper.acceptMail()
		print 'back'
		if mailBody:
			exe = self.mailHelper.analysisMail(mailBody)
			print exe
			if exe:
				commondType = str(exe['subject'].split(';')[0])
				commond = str(exe['subject'].split(';')[1])
				self.operator.process(commondType, commond)
				if commondType in ['Open', 'Commond']:
					self.mailHelper.sendMail('Ok', 'Slave')
	
	
if __name__ == '__main__':
	mcc = MCC()