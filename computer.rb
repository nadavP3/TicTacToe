# This file contains the "AI's" (Non-human player / the computer) code, it’s just a matter of priority of possible moves ("nothing fancy").

module Computer
  require_relative "board"

  def move_priority(player_history, computer_history) # initially board's entries were provided here, changed it for clarity.
    board = Board.new
    wining_combos = board.wining_combos
    # Strategy: (ordered by priority, sourced from Wikipedia, see https://en.wikipedia.org/wiki/Tic-tac-toe):
    # 1. Make a wining move if possible.
  	# 2. Make a blocking move if possible.
  	# 3. Take the center cell if no player claimed it.
  	# 4. Take a corner cell if no player claimed it.
  	# 5. take a random cell (play a turn).

  	# 1. make a winning move if possible:
  	# Checks to see if any win scenario shares two numbers/cells with computer's cells.
  	# If so checks if the remaining (unshared) cell is already taken by the other player (the human).
  	# If the missing cell is not taken, then that's the cell to take.
    win_possible = false
    to_win = 0
    need = []
  	wining_combos.each do |win_scenario|
  		intersection = win_scenario & computer_history
  		if intersection.size == 2
  			need = win_scenario - intersection
  			if player_history.include?(need[0]) == false
  				win_possible = true
  				to_win = need[0]
  			end
  		end
  	end

		# 2. Make a blocking move if possible: (similar to the above)
		# Checks to see what's shared between player's history and each wining scenario.
		# If what's found is 2/3 and computer's doesn't already have that cell,
    # then this is the cell to obtain next in order to block human's victory.
    loss_possible = false
    to_block = 0
    wining_combos.each do |win_scenario|
  		intersection = win_scenario & player_history
  		if intersection.length == 2 && ((player_history | computer_history) & win_scenario).size < 3
  			need = win_scenario - intersection
  			to_block = need[0]
  			if computer_history.include?(to_block) == false
  				loss_possible = true
  			end
  		end
  	end

    # Main "switch board", all logic is routed here.
  	if win_possible == true
  		return to_win # Play this move (1. Make wining move if possible).
  	elsif loss_possible == true
  		return to_block # Play this move (2. Make blocking move if possible).
  	elsif (player_history.sort == [1,9]) # Player has this two corners, but computer have corner -> setup a line (2/3).
  		return [2,6].sample
  	elsif (player_history.sort == [3,7]) # Same as above 3 lines just inverted.
  		return [2,4,6,8].sample
  	elsif (player_history | computer_history).include?(5) == false # (3. Take center cell if it is empty).
  		return 5
  	elsif ((player_history | computer_history) & [1,3,7,9]).size!=4 # (4. Check if any of the four corners is available, if anything is found - take one such cell).
  		return ([1,3,7,9] - (player_history | computer_history)).sample
  	else
  		remaining = (1..9).to_a - (player_history | computer_history) # (5. Aiming for whatever else is empty),
  		return remaining.sample                                       #     Realistically this won't be a corner or center if we made it this far.
  	end                                                             #     This step is crucial to make sure the game moves forward.
  end
end
