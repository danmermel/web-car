#! /usr/bin/ruby
require 'cgi'

#$stdout.reopen("output.txt", "w")
#$stderr.reopen("errors.txt", "w")

puts "here i am"
cgi = CGI.new

input = cgi.params 
command = "sudo ruby motor.rb #{input['direction']}"
puts command
exec(command)

