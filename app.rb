require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Paul")
player2 = Player.new ("Pierre")

puts "Commençons le duel !"
puts "player 1 : #{player1.name}"
puts "player 2 : #{player2.name}"
puts " "
while player1.life_points > 0 && player2.life_points >0 do
puts " "
puts "Voici l'état de chaque joueur :"
puts player1.show_state
puts player2.show_state
puts " "
puts "Let's goooo !"
puts "------------------------------------------------"
puts " "
player1.attacks(player2)
    if player2.life_points <= 0
    break
    end
player2.attacks(player1)
    if player1.life_points <= 0
    break
    end
end

#binding.pry