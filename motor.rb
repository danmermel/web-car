#! /usr/bin/ruby

require 'wiringpi'
require 'io/console'


# next two lines output messages and errors to a file, for debugging
$stdout.reopen("moto_out.txt", "w")
$stderr.reopen("moto_err.txt", "w")



io = WiringPi::GPIO.new

direction =  ARGV[0]   # get the instruction for direction
puts direction

# 0 = right fwd
# 3 = right back
# 4 = left fwd
# 1 = left back

puts "turning on"

begin    # set the pins to OUT
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



   if direction == "[fwd]" then  #forward
       stop_all(io)
       io.write(0,HIGH)
       io.write(4,HIGH)
      puts "going forward"
   end
   if direction == "[bck]" then  # back
       stop_all(io)
       io.write(3,HIGH)
       io.write(1,HIGH)
      puts "going back"
   end
   if direction == "[lft]" then #left
       stop_all(io)
       io.write(0,HIGH)
      puts "going left"
   end           
   if direction == "[rgt]" then #right
       stop_all(io)
       io.write(4,HIGH)
      puts "going right"
   end  

   stop_all(io) if direction == "[stp]"

puts "goodbye"
