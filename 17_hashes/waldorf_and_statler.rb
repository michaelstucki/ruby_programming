# modules cannot be instantiated
# use for a collection of related methods

module WaldorfAndStatler
  def self.roll_die
    rand(1..6)
  end

	def self.review(movie)		# make this a module method
      number_rolled = roll_die
      case number_rolled
      when 1..2
        movie.thumbs_down
        puts "#{movie.title} got a thumbs down."
      when 3..4
        puts "#{movie.title} was skipped."
      else
        movie.thumbs_up
        puts "#{movie.title} got a thumbs up!"
      end
	end
end

# WaldorfAndStatler.review