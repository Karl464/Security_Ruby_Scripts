#!/usr/bin/ruby 

=begin

Simple SQL connection and data extraction 
Old Version of ruby and gem

=end

require 'dbi'

dbh = DBI.connect('DBI:Pg:test', 'test', 'test') 
dbh.do("set client_min_messages = 'warning'")
db_create = 'create table people(
id SERIAL,
name varchar(256),
homepage varchar(256)
)'

dbh.do('drop table if exists people')

q = dbh.prepare(db_create)

q.execute()

qstring  = "insert into people (name, homepage) values ('user1', 'http://www.xlabs.com')" 
dbh.prepare(qstring).execute()

qstring  = "insert into people (name, homepage) values ('user1', 'http://www.pentestx.com')" 
dbh.prepare(qstring).execute()

qstring  = "select * from people"

q.execute()
q.each do |row|
    print "ID: #{row[0]}, Name: #{row[1]}, HomePage: #{row[2]}\n" 
end
