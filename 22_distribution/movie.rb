require_relative 'rankable'

class Movie
  include Rankable
  attr_accessor :title, :rank  # read-write

  def initialize(title, rank=0)
    @title = title.capitalize
    @rank = rank
    @snack_carbs = Hash.new(0)
  end

  def self.from_csv(line)
    title, rank = line.split(',')
    Movie.new(title, Integer(rank))
  end

  def to_csv
    "#{@title},#{@rank}"
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