letters = {
	'c' => 3,
	'e' => 1,
	'l' => 1,
	'n' => 1,
	't' => 1,
	'x' => 8,
	'y' => 4
}

word = "excellently"

score = 0
word.each_char { |c| score += letters[c] }

puts score

points_total = Hash.new(0)
word.each_char { |c| points_total[c] += letters[c] }
puts points_total

puts points_total.values.reduce(:+)
