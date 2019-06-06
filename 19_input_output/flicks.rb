require_relative 'playlist'

# movie1 = Movie.new("goonies", 10)
# movie2 = Movie.new("ghostbusters", 9)
# movie3 = Movie.new("goldfinger")

playlist1 = Playlist.new("Kermit")
playlist1.load(ARGV.shift || "movies.csv")

loop do
	puts "How many viewings? ('quit to exit')"
	answer = gets.chomp.downcase
	case answer
	when /^\d+$/
		playlist1.play(answer.to_i)
	when 'quit', 'exit'
		playlist1.print_stats
		break
	else
		puts "Please enter a number or 'quit'"
	end
end

playlist1.save