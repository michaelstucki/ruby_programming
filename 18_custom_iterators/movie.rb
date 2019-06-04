class Movie
  attr_reader :rank     # read only
  attr_accessor :title  # read-write

  def initialize(title, rank=0)
    @title = title.capitalize
    @rank = rank
    @snack_carbs = Hash.new(0)
  end

  def each_snack
    @snack_carbs.each do |name, carbs|
      yield(Snack.new(name, carbs))
    end
  end

  def ate_snack(snack)
    @snack_carbs[snack.name] += snack.carbs
    puts "#{@title} led to #{snack.carbs} #{snack.name} being consumed."
    puts "#{@title}'s snacks: #{@snack_carbs}"
  end

  def carbs_consumed
    @snack_carbs.values.reduce(0, :+)
  end

  def hit?
    @rank >= 10
  end

  def status
    hit? ? "Hit" : "Flop"
  end

  def normalized_rank # a virtual attribute, derives from instance variables
    @rank / 10
  end

  def thumbs_up
    @rank += 1
  end

  def thumbs_down
    @rank -= 1
  end

  def <=>(other_movie)
    other_movie.rank <=> @rank
  end

  def to_s
    "#{@title} has a rank of #{@rank} (#{status})"
  end
end

if __FILE__ == $0 # only run this if the currently running file is this file
  movie = Movie.new("goonies", 10)
  puts movie.title
  puts movie.rank
  movie.thumbs_up
  movie.thumbs_up
  movie.thumbs_down
  puts movie.rank
  puts movie
end