#-*- coding:utf-8 -*-
#!/usr/bin/python

import MySQLdb
from flask import Flask, jsonify, request, render_template
import os
import sys
import json
import dbOpera
#reload(sys)
#sys.setdefaultencoding('gbk')

app = Flask(__name__)


def changeToShow(from_list):
	dicList =[]
	for item in from_list:
		itemDic = {
			'status':item[0],
			'text':item[1]
		}	
		dicList.append(itemDic)	
	return dicList 
	


@app.route('/todo/api/v1.0/fruits', methods=['GET'])
def get_tasks():
	fruit = '水果'
	returnDic = {'fruit': fruit}
	obj = {'name':'张三',
			'email':'email@com'}

	return jsonify(obj)

@app.route('/todo/scanDB/', methods = ['GET'])
def skan_db():
	dataList = dbOpera.scan('MyClass')
	print dataList
#	return dict(dataList)

@app.route('/todo/api/', methods=['GET'])
def get_profiles():
	eventList = dbOpera.scan('thingList')
	dicList = changeToShow(eventList)	
	return render_template('todo.html', items = dicList)
	

@app.route('/todo/api/add', methods = ['GET', 'POST'])
def add():
	something = request.form['something']
	print something
	value = "0, '%s'" % something
	eventList = dbOpera.insert('thingList', value)
	dicList = changeToShow(eventList)
	return render_template('todo.html', items = dicList) 
	

@app.route('/todo/api/v1.0/fruits/del_fruit', methods = ['GET'])
def del_fruit():
#	if request.method == 'POST' or request.method == 'GET':
	fruitname = request.args.get('name')
	print fruitname
	return jsonify({'fruit': dict(info)})


if __name__ == '__main__':
	app.run(debug=True, host = '0.0.0.0',port = 5000)



