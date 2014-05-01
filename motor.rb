#! /usr/bin/ruby

require 'wiringpi'
require 'io/console'
#require 'cgi'

$stdout.reopen("moto_out.txt", "w")
$stderr.reopen("moto_err.txt", "w")



io = WiringPi::GPIO.new
#cgi = CGI.new
#input = cgi.params
#puts input['direction'][0]

puts "hellooo"
direction =  ARGV[0]
puts direction

# 0 = right fwd
# 3 = right back
# 4 = left fwd
# 1 = left back

puts "turning on"

begin
   io.mode(0,OUTPUT)
   io.mode(1,OUTPUT)
   io.mode(3,OUTPUT)
   io.mode(4,OUTPUT)
rescue
   puts "failed to set pins"
   puts $!, $@
end


def stop_all(var)  #stops everything before next manouvre
   var.write(0,LOW)
   var.write(1,LOW)
   var.write(3,LOW)
   var.write(4,LOW)
end



   if direction == "[w]" then  #forward
      # stop_all(io)
      # io.write(0,HIGH)
      # io.write(4,HIGH)
      puts "going forward"
   end
   if direction == '[x]' then  # back
      # stop_all(io)
      # io.write(3,HIGH)
      # io.write(1,HIGH)
      puts "going back"
   end
   if direction == 'a' then #left
      # stop_all(io)
      # io.write(0,HIGH)
      puts "going forward"
   end           
   if direction == 'd' then #right
      # stop_all(io)
      # io.write(4,HIGH)
      puts "going forward"
   end  

   stop_all(io) if direction == 's'

puts "goodbye"
