#!/usr/bin/ruby 

=begin

List proces (ID) information
Execution Example:
> ruby PID_File_Manipulation.rb 71152

=end

require 'etc'

pid = ARGV[0].to_i
cwd = File.readlink("/proc/#{pid}/cwd")
owner = File.stat("/proc/#{pid}/cmdline").uid
file = File.new("/proc/#{pid}/cmdline")
cmdline = file.read.split("\000")
file.close
filename = cmdline.shift
print "Process #{pid} is owned by #{Etc.getpwuid(owner).name}\n" 
print "Process #{pid} CWD: #{cwd}\n"
print "Process #{pid} Command: #{filename} #{cmdline.join(' ')} \n"