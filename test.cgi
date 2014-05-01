#!/usr/bin/ruby

require 'cgi' 

cgi = CGI.new
puts cgi.header
puts "<html><body>This is a test</body></html>"
h= cgi.params
puts "hello", h['FirstName'] , h['LastName']
