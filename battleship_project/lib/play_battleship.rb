# No need to change or write any code in this file.
#
# After you complete all specs, you can play your game by
# running this file with `ruby lib/play_battleship.rb` in your terminal!

require_relative "battleship"

print "Enter a size for the game: "
n = gets.chomp.to_i
while n < 1
  print "Invalid size "
  n = gets.chomp.to_i
end
battleship = Battleship.new(n)
battleship.start_game

until battleship.game_over? do
  puts "-------------------------"
  battleship.turn
end
