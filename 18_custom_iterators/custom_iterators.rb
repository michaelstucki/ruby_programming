# 1. yield causes control to pass over to the block.
# 2. iterator methods decouple the actual looping from
#    what happens during each iteration (as defined in the block).
# 3. The last expression evaluated by the block is the return
#    value of the yield.

def once
	puts "before yield"
	yield
	puts "after yield"
end

def twice
	puts "before yield"
	yield
	yield
end

def three_times
	puts "Ready"
	yield(1)
	puts "Set"
	yield(2)
	puts "Go!"
	yield(3)
end

once { puts "Running your block" }

twice { puts "Running your block" }

three_times { |number| puts number * number }

def compute
	if block_given?
		puts yield
	else
		puts "Does not compute!"
	end
end

compute do
	"Hello"
	7
	3.14
end

compute

numbers = (1..10).to_a
puts numbers.select { |n| n.even? }

def my_select(array)
	results = []
	array.each do |element|
		results << element if yield(element)
	end
	results
end

puts my_select(numbers) { |n| n.even? }



