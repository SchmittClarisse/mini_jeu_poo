require "bundler"
Bundler.require

class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    return "#{@name} a #{@life_points} points de vie."
  end

  def gets_damage(damage_received) 
    @life_points = @life_points - damage_received   
    if @life_points <= 0
    puts "Le joueur #{@name} a été tué ! AMEN † ♥ † "
    end
  end

  def attacks(player)
    puts "#{@name} attaque #{player.name} !"
    damage = compute_damage
    puts "Il lui inflige #{damage} points de dégats."
    player.gets_damage(damage)
  end

  def compute_damage
    return rand(1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @name = name
    @weapon_level = 1
    @life_points = 100
  end 

  def show_state
    puts "#{@name} a #{@life_points} points de vie, avec une arme de niveau #{@weapon_level}."
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon = rand(1..6)
    puts "Arme de niveau #{new_weapon}"
    if new_weapon > weapon_level
      @weapon_level = new_weapon
      puts "Youhou une nouvelle arme, elle a un niveau #{new_weapon}! \u{1F340} ♡"
    else
      puts "Nul, pose ça !"
    end
  end

  def search_health_pack
    health_pack = rand(1..6)
    case(health_pack)
    when health_pack == 1
      puts "Tu n'as rien récup !"
    when health_pack = (2..5)
      puts "Tu viens d'augmenter ton niveau de vie de 50 points !"
      (@life_points + 50 >= 100) ? (@life_points = 100) : (@life_points += 50)      
    else
      puts "Wahouuu ! Tu viens d'augmenter ton niveau de vie de 80 points !"
    (@life_points + 80 >= 100) ? (@life_points = 100) : (@life_points += 80)
    end
  end

end



