#!/usr/bin/ruby 

=begin

connect and grab the web banner;
Use this command to execute the Script:
> ruby web.rb 10.0.2.15

=end

require 'net/http'

def getHeader (host, port = nil) 
    port = port || 80

Net::HTTP.start(host.to_s, port) do |http| 
    resp = http.head('/')
    return [resp['server'].to_s, resp['Last-Modified'].to_s]
end

return [nil,nil]

end

if ARGV.size <= 0 || ARGV.size > 2 
    print "Usage: #{$0} Host [Port]\n"

exit

end

server, modified = getHeader(ARGV[0],ARGV[1])

print "Server #{ARGV[0]}: #{ARGV[1] || 80} (#(server)) last modified #{modified}\n"

