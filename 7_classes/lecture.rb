greeting = "Hello"
puts greeting.class

greeting = String.new("Hello")
puts greeting
puts greeting.reverse
puts greeting.upcase
farewell = String.new("Goodbye")
puts farewell
puts farewell.reverse
puts farewell.upcase

puts greeting.object_id
puts farewell.object_id

t1 = Time.new
puts t1
puts t1.sec
puts t1.monday?

t2 = Time.new
puts t2
puts t2.sec
puts t2.monday?

