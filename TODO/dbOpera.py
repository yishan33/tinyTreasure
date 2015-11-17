#encoding:utf-8
#!/usr/bin/python

import MySQLdb
import sys
reload(sys)
sys.setdefaultencoding('utf-8')


def mysql(f):
	def _deco(*args):
		conn = MySQLdb.connect(host = 'localhost', user = 'lfs', passwd = 'lfs653', db = 'todoDB', port = 3306, charset = "utf8")

		cur = conn.cursor()
		kwargs = {
			'cur':cur
		}
		ret = f(*args, **kwargs)
		cur.close()
		conn.commit()
		conn.close()
		return ret
	return _deco

@mysql
def scan(table, cur = None):
#	count = cur.execute('select * from %s', table)
	count = cur.execute('select * from %s' % table)
	info = cur.fetchmany(count)
	return info

@mysql
def update(table, newValue, condition, cur = None):
	cur.execute('update %s set %s where %s' % (table, newValue, condition))
	return 
	
@mysql	
def insert(table, itemValue, cur = None):
	cur.execute('insert into %s value(%s)' % (table, itemValue))
	count = cur.execute('select * from %s' % table)
	info = cur.fetchmany(count)
	return info


@mysql
def delete(table, condition, cur = None):
	cur.execute('delete from %s where %s' % (table, condition))
	return	
	
@mysql
def insertField(table, newField, cur = None):
	cur.execute('alter table %s add %s' % (table, newField))
	return
	
@mysql
def deleteField(table, oldField, cur = None):
	cur.execute('alter table %s drop %s' % (table, oldField))
	return

@mysql
def rename(oldName, newName, cur = None):
	cur.execute('rename %s to %s' % (oldName, newName))
	return
	


