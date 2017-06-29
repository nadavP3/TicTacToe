# This is the Player VS Play module.

module Pvp
  require_relative "board"

  def new_player(id, token)
  	case id
  	when 1
  		puts "Please enter a name for the 1st player"
  	when 2
  		puts "Please enter a name for the 2nd player"
  	else
  		raise "ERROR: invalid player id was provided" # This can't actually happen due to checks on other side.
  	end
  	Player.new(:name => gets.chomp, :token => token, :history => [])
  end

  def play_vs_player
    player1 = new_player(1, "X")
    player2 = new_player(2, "O")
    reset_screen
    board = Board.new
    wining_combos = board.wining_combos
    played_moves = 1
    game_is_done = false
    while game_is_done == false
      if played_moves % 2 == 1
        current_player = player1
      else
        current_player = player2
      end
      board.display_board
      location = board.place_token(current_player.name)
      current_player.history << location
      board.modify_board(current_player, location)
      wining_combos.each do |win_scenario|
        if (current_player.history & win_scenario).sort == win_scenario
          game_is_done = true
        end
      end
      if game_is_done == true
        board.display_board
        show_dont_panic
        puts "#{current_player.name} wins the game!"
      elsif played_moves == 9
        game_is_done = true
        board.display_board
        puts "It's a tie!"
      else
        played_moves += 1
      end
    end
  end
end
