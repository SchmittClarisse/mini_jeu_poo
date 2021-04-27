require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'

puts "Quel est ton nom ?"
print ">"
human_name = gets.chomp
puts
my_game = Game.new(human_name)