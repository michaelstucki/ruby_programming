module StudioGame
  Treasure = Struct.new(:name, :points)

  module TreasureTrove
    TREASURES = [
      Treasure.new(:pie, 5),
      Treasure.new(:bottle, 25),
      Treasure.new(:hammer, 50),
      Treasure.new(:skillet, 100),
      Treasure.new(:broomstick, 200),
      Treasure.new(:crowbar, 400)
    ]

    def self.random
      TREASURES.sample
    end

    def self.print_treasures
      puts "There are #{TREASURES.size} treasures in the Treasure Trove:"
      puts "Item".rjust(15) + " " + "Points".ljust(4)
      puts "----".rjust(15) + " " + "------".ljust(4)
      TREASURES.each do |treasure|
        puts "#{treasure.name.to_s.rjust(15)} #{treasure.points.to_s.ljust(4)}"
      end
    end
  end
end