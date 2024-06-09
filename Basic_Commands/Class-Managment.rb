#!/usr/bin/ruby

=begin
Do not expose everything to the user.
This is an example on how to use:
* Readers
* Writers
* Accessors
=end


class Test
    attr_reader :error 
    attr_writer :request 
    attr_accessor :other
    def test
        @error = "You can't change me!"
        print "Request contains #{@request}\n" 
        print "other contains #{@other} \n"
    end
end

mytest = Test.new

print "Trying to set error to 'change me'\n"

begin
    mytest.error= "change me"
rescue
    print "...changing error fatled\n\n"
end

print "Setting request to 'Testing 123 and other to 'we can change this at will' \n\n" 
mytest.request = "Testing 123"
mytest.other = "we can change this at will"
print "Calling test function...\n"
mytest.test

print "\n"
print "Directly querying data...\n"
print "Error is #{mytest.error}\n" 
print "Other is #{mytest.other}\n"
begin
    print "Request is #{mytest.request}\n"
rescue
    print "Failed to query mytest.request, it is write only\n"
end