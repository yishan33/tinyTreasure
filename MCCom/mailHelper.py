#encoding:utf-8
#!/usr/bin/python

from email.mime.text import MIMEText
import poplib
import smtplib
import re
from biplist import *
import base64

import sys
reload(sys)
sys.setdefaultencoding('utf-8')

PlistName = 'setting.plist'
plist = readPlist(PlistName)

class mailHelper(object):
	
	def __init__(self):
		self.pophost = plist['Slave']['pophost']
		self.smtphost = plist['Slave']['smtphost']
		self.port = plist['Slave']['port']
		self.username = plist['Slave']['username']
		self.password = plist['Slave']['password']
		self.bossMail = plist['Boss']['mail']
		self.loginMail()
		self.configSlaveMail()
		
	def loginMail(self):
		print 'begin login mail'
		try:
			self.pp = poplib.POP3_SSL(self.pophost)
			self.pp.set_debuglevel(0)
			self.pp.user(self.username)
			self.pp.pass_(self.password)
			self.pp.list()
			print 'login Success!'
			
		except Exception, e:
			print 'login Fail', e
			exit()
			
	def acceptMail(self):
		print 'begin to get mails'
		try:
			ret = self.pp.list()
			print 'get list success'
			mailBody = self.pp.retr(len(ret[1]))
			print mailBody
			print 'get mail Success'
			return mailBody
		
		except Exception, e:
			print 'get mail Failed', e
			return None
			
#			, 'Subject: =?UTF-8?B?5biQ5Y+35r+A5rS76YKu5Lu2?=', 'MIME-Version: 1.0', 'Content-Type: text/plain; 
#', 'From: tuling123@uzoo.cn', 'Tcharset=UTF-8', 'Content-Transfer-Encoding:' 
	def analysisMail(self, mailBody):
		print 'begin to get subject and senderInfo'
		try:
			
			mailBody = str(mailBody).decode('utf-8')
			subject = re.search("'Subject: ([^']*)'", mailBody).group(1)
			print 'subject: \n' + subject + '\n'
			# print base64.b64decode(subject)
			sender = re.search("From: ([^\']*)", mailBody).group(1)
			sender = re.search('<(.*)>', sender).group(1)
			command = {'subject':subject, 'sender':sender}
			return command
			
		except Exception, e:
			print 'fail', e
			return None
			
	def configSlaveMail(self):
		print 'begin to set backMessageBox'
		try:
			self.handle = smtplib.SMTP(self.smtphost, self.port)
			self.handle.login(self.username, self.password)
			print 'backMessageBox is ready'
		
		except Exception, e:
			print 'backMessageBox setting Failed', e
			exit()
			
	def sendMail(self, subject, receiver, body = 'Success'):
		print 'begin to send mail back'
		msg = MIMEText(body, 'plain', 'utf-8')
		msg['Subject'] = subject
		msg['from'] = self.username
		print 'begin to send mail'
		if receiver == 'Slave':
			try:
				self.handle.sendmail(self.username, self.username, msg.as_string())
				print 'email send success'
				return True
				
			except Exception, e:
				print 'email send failed'
				return False
				
		elif receiver == 'Boss':
			try:
				self.handle.sendmail(self.username, self.bossMail, msg.as_string())
				print 'send email to boss'
			except Exception, e:
				print 'send email to boss failed'
				return False
				

if __name__ == '__main__':
	mail = mailHelper()
	body = mail.acceptMail()
#	print body
	print mail.analysisMail(body)
		
		
		
	
	
	










					
			
			
			