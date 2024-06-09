#!/usr/bin/ruby 

=begin

Simple Ping Sweep Net Scanner on ruby

extension capabilities of Ruby:
for /L %i in (1,1,255) do @ping -n 1 -w 200 10.0.2.%i > nul && echo 192.168.1.%i is up.

=end

finished = []
ips = []
range = 1..254

range.each do |i|
  ip_address = "10.0.2.#{i}"
  Thread.new do
    `ping -q -c1 -W1 #{ip_address}`.split(/\n+/)[2].split(/,\s*/)[1].to_i > 0 and ips << ip_address
    finished << i
  end
end

until finished.count == range.count
  print "\r%#{(finished.count/range.count.to_f * 100).round}"
  sleep 0.1
end

print "\r          \r"
puts ips.sort_by! {|ip| ip.split('.').map{|octet| octet.to_i}}