#!/usr/bin/ruby 

=begin

Simple SQL connection and table interaction 

=end

require 'active_record'
ActiveRecord::Base.establish_connection(
    :adapter => 'postgresql',
    :username => 'test',
    :password => 'test',
    :database => 'test'
)

class Person < ActiveRecord::Base

end

alonso = Person.where(:name => 'alonso', :homepage => 'http://www.xlabs.com').first_or_create

print "Fetching all records\n"

Person.all.each { |p| print "ID: #{p.id} Name: #{p.name} HomePage: #{p.homepage}\n"}

print "Fetching individual records\n"

alonso = Person.find_by_name('alonso')

print "ID: #{alonso.id} Name: #{alonso.name} HomePage: #{alonso.homepage}\n"
