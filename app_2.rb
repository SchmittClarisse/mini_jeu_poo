
require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'

puts " "
puts ' -------------------------------------------------'
puts " | Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts " | Le but du jeu est d'etre le dernier survivant !|"
puts " -------------------------------------------------"
puts " "

puts "Quel est ton nom ?"
print ">"

user = HumanPlayer.new(gets.chomp)

enemies = []
enemies << player1 = Player.new("Paul")
enemies << player2 = Player.new("Pierre") 
player1= enemies[0]
player2 = enemies[1]

while user.life_points > 0 && (player1.life_points > 0 && player2.life_points > 0)
    
    user.show_state

    break if((player1.life_points == 0 and player2.life_points == 0) or user.life_points == 0)
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner "
    puts " "
    puts "attaquer un joueur en vue :"
    puts "0 - attaquer joueur 1 #{player1.show_state}"
    puts "1 - attaquer joueur 2 #{player2.show_state}"
  
    puts "Votre réponse :"
    print ">"
    user_answer = gets.chomp
    puts " "
  
    if(user_answer == "a")
      then user.search_weapon
    end
  
    if(user_answer == "s")
      then user.search_health_pack
    end
  
    if(user_answer == 0.to_s)
      then user.attacks(player1)
    end
  
    if(user_answer == 1.to_s)
      then user.attacks(player2)
    end
    puts " "
    puts "Les autres joueurs t'attaquent !"
  
    enemies.each do |current_player|
      if(current_player.life_points != 0)
        then current_player.attacks(user)
      end
    end 
end

puts "La partie est finie"
if(user.life_points != 0)
  puts "BRAVO ! TU AS GAGNE !"
  else "Loser ! Tu as perdu !"
end