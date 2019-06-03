require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
  attr_reader :title

  def initialize(title)
    @title = title.capitalize
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play(rounds)
    puts "There are #{@players.size} players in #{@title}:"
    @players.sort.each do |player|
      puts player
    end

    TreasureTrove.print_treasures

    1.upto(rounds) do |round|
      puts "\nRound #{round}:"
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end
  end

  def print_name_and_health(player)
    puts "#{player.name} (#{player.health})"
  end

  def print_stats
    strong_players, wimpy_players = @players.partition { |player| player.strong? }

    puts "#{@title}'s Statistics:"
    
    puts "\n#{strong_players.size} strong players:"
    strong_players.sort.each { |player| print_name_and_health(player) }

    puts "\n#{wimpy_players.size} wimpy players:"
    wimpy_players.sort.each { |player| print_name_and_health(player) }

    puts "\n#{@title}'s High Scores:"
    @players.sort.each { |player| puts "#{player.name.ljust(22, '.')} #{player.health}" }

    @players.sort.each do |player|
      puts "\n#{player.name}'s point totals:"
      puts "#{player.points} grand total points"
    end

    puts "#{total_points} total points from treasures found"
  end

  def total_points
    @players.reduce(0) { |sum, player| sum + player.points }
  end
end
