#!/usr/bin/ruby 

=begin

Simple TCP Server on ruby

Execute this script with:
> ruby TCP_Server.rb

Test this script with:
> curl localhost:8880

=end

require 'socket'

banner = "HTTP/1.1 200 OK

Date: Fri, 9 Oct 2020 01:23:45 GMT
Content-Lenght: 0
Connection: close
Content-Type: text/html\n\n"

server = TCPServer.open('localhost', 8880)

loop {
    client = server.accept
    req = client.recv(1024).split("\r\n")

headers = {}

req.each do |l|
    k, v = l.split(':',2)
    headers[k] = v
end

print "#{Time.now} - #{client.peeraddr.last}\n"
print "\t#{headers['Referer']} - #{headers['User-Agent']}\n"

client.puts banner
client.close
}