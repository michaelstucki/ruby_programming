require_relative 'movie'

movie = Movie.new("godfather", 10)

if movie.rank >= 10
	puts "Hit"
end

puts "Hit" if movie.rank >= 10

if movie.rank < 10
	puts "Flop"
end

if movie.rank >= 10
	puts "Hit"
else
	puts "Flop"
end