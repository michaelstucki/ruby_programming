require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'
require 'csv'
require_relative 'clumsy_player'
require_relative 'berserk_player'

module StudioGame
  class Game
    attr_reader :title

    def initialize(title)
      @title = title.capitalize
      @players = []
    end

    def load_players(from_file)
      # File.readlines(from_file).each do |line|
      #   add_player(Player.from_csv(line))
      # end
      CSV.foreach(from_file) do |row|
        add_player(Player.new(row[0], row[1].to_i))
      end
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
        if block_given?
          break if yield
        end
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
      @players.sort.each { |player| puts high_score_entry(player) }

      @players.sort.each do |player|
        puts "\n#{player.name}'s point totals:"
        player.each_found_treasure do |treasure|
          puts "#{treasure.points} total #{treasure.name} points"
        end
        puts "#{player.points} grand total points"
      end

      puts "#{total_points} total points from treasures found"
    end

    def total_points
      @players.reduce(0) { |sum, player| sum + player.points }
    end

    def save_high_scores(to_file="high_scores.txt")
      File.open(to_file, "w") do |file|
        file.puts "#{@title}'s High Scores:"
        @players.sort.each { |player| file.puts high_score_entry(player) }
      end
    end

    def high_score_entry(player)
      formatted_name = player.name.ljust(20, '.')
      "#{player.name.ljust(20, '.')} #{player.score}"
    end
  end
end