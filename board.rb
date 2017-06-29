# This file contains board (visually), board altering function and turn mechanics.

class Board
	attr_accessor :entries

	def initialize
		@entries = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
		# Included 0 even though it's not on the board, to offset by 1.
		# From player's POV its easier to play between 1-9 (vs to play between 0-8).
		# From programmer's POV its easier to develop when location's name and location's value are the same.
	end

	def wining_combos
		return ([[1,2,3],
			 			[4,5,6],
					  [7,8,9],
					  [1,4,7],
					  [2,5,8],
					  [3,6,9],
					  [1,5,9],
					  [3,5,7]]) # this values shouldn't change
	end

	def display_board
		# Now visually enhanced via extended ASCII characters (see info at end of file).
		reset_screen
		puts "╔═══╦═══╦═══╗"
		puts "║ #{@entries[1]} ║ #{@entries[2]} ║ #{@entries[3]} ║"
		puts "╠═══╬═══╬═══╣"
		puts "║ #{@entries[4]} ║ #{@entries[5]} ║ #{@entries[6]} ║"
		puts "╠═══╬═══╬═══╣"
		puts "║ #{@entries[7]} ║ #{@entries[8]} ║ #{@entries[9]} ║"
		puts "╚═══╩═══╩═══╝"
		puts "\n\n"
	end

	def place_token(player)
		# The board manages human token placement, will prevent illegal moves.
	  puts "#{player}'s turn:".capitalize
	  puts "Where would you like to place your token"
	  puts "(number must be between 1 and 9 and location must not be occupied by X or O)\n"
		location = gets.chomp.to_i
		# Checking first if the input is valid number,
		# Then checking if that location is empty (empty locations show up as number that represents their location)
		# The order of this two parts matter:
		# While it won't crash if we try to check the content of an out of bound location in our entries array -
		# its better if we don't do that and as far as I know, Ruby will not evaluate the second part if -
		# the first one is false and there's an "and" between them ((false && X) === false).
			until (1..9).to_a.include?(location) && @entries[location].to_i.between?(1, 9)
				if (1..9).to_a.include?(location) && @entries[location].to_i.between?(1, 9)
					return location
				end
				display_board
				# Please excuse this lack of DRY (lines 25-29 & 43-46 / displaying turn's text), since its a single repeat -
				# breaking it down to a function will just reduce code readability.
				puts "#{player}'s turn:".capitalize
				puts "Where would you like to place your token"
				puts "(number must be between 1 and 9 and location must not be occupied by X or O)\n"
				location = gets.chomp.to_i
			end
		 location
	end

	def modify_board(player, location)
		if location.to_i.between?(1, 9)
			@entries[location] = player.token
		else
			raise "ERROR: invalid location was provided" # This can't actually happen due to checks on other side.
		end
	end
end

# Extended ASCII characters chart
# via http://www.theasciicode.com.ar/
#
# 185 = ╣ HTML: &boxVL;
# 186 = ║ HTML: &boxV;
# 187 = ╗ HTML: &boxDL;
# 188 = ╝ HTML: &boxUL;
# 200 = ╚ HTML: &boxUR;
# 201 = ╔ HTML: &boxDR;
# 202 = ╩ HTML: &boxHU;
# 203 = ╦ HTML: &boxHD;
# 204 = ╠ HTML: &boxVR;
# 205 = ═ HTML: &boxH;
# 206 = ╬ HTML: &boxVH;
