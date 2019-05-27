class Movie
  attr_reader :rank     # read only
  attr_accessor :title  # read-write

  def initialize(title, rank=0)
    @title = title.capitalize
    @rank = rank
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