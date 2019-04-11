class Movie
  attr_reader :rank     # read only
  attr_accessor :title  # read-write

  def initialize(title, rank=0)
    @rank = rank
    @title = title
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

  def to_s
    "#{@title} has a rank of #{normalized_rank}"
  end
end

movie1 = Movie.new("goonies", 10)
puts movie1.title
puts movie1.rank
movie1.title = "Gooneys"
puts movie1.title
puts movie1.normalized_rank
puts movie1

