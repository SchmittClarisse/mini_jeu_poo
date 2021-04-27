class Game
    attr_accessor :human_player, :enemies

    def initialize(human_player)
        @human_player = HumanPlayer.new(human_player)
        @@enemies << @player1 = Player.new("x1")
        @@enemies << @player2 = Player.new("x2")
        @@enemies << @player3 = Player.new("x3")
        @@enemies << @player4 = Player.new("x4")
    end

    def kill_player
        @@enemies.each do |player|
          if(player.life_points == 0)
            then @@enemies.delete(player)
          end
        end
    end
end

