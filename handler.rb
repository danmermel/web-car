#! /usr/bin/ruby
require 'cgi'

# these two lines direct output to a file, for debugging
#$stdout.reopen("handler_out.txt", "w")
#$stderr.reopen("handler_err.txt", "w")

cgi = CGI.new

input = cgi.params 
command = "sudo ruby motor.rb #{input['direction']}"  #build the command to execute
puts command
exec(command)

