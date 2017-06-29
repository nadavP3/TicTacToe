# This is the runner file.

require_relative 'board'
require_relative 'player'
require_relative 'computer'
require_relative 'view'
require_relative 'pvp'
require_relative 'pve'
include Computer
include Pvp
include Pve

main_menu
game_mode = gets.chomp
while (game_mode != "c" && game_mode != "p")
	main_menu
	puts "Bad input, please try again"
	game_mode = gets.chomp
end

if game_mode == "p" # Player vs Player mode was chosen.
	Pvp.play_vs_player
elsif game_mode == "c" # Computer vs Player mode was chosen.
	Pve.play_vs_computer
end
