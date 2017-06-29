# This is the Player VS Environment (AI/Computer/Single player) module.

module Pve
  require_relative "board"

  def play_vs_computer
    puts "Please enter your name:"
    player1 = Player.new(:name => gets.chomp, :token => "X", :history => [])
    player2 = Player.new(:name => "GLaDOS", :token => "O", :history => [])
    board = Board.new
    wining_combos = board.wining_combos
    played_moves = 1 # If this is set to 0 the computer will go first, but game could last ten turns, thus I don't let the user decide on this.
    game_is_done = false

    while game_is_done == false # If the state changes to true during an iteration of a while loop,
                                # the rest of the iteration will run but a new iteration won't start.
                                # (and that's why I check the state inside the loop).
      if played_moves % 2 == 1 # Player's turn.
        current_player = player1
        if played_moves == 1
          board.display_board
        end
        location = board.place_token(current_player.name)
        current_player.history << location
        board.modify_board(current_player, location)
        wining_combos.each do |win_scenario|
          puts current_player.history.to_s
          # For each wining scenario (see wining_combos) -> takes player's history (where on the board player have tokens placed).
          # Remove all tokens except ones that are used in this particular wining scenario/combo.
          # (ex: 1,2,3) if it ends up with 3 unique digits {as in, == that particular wining scenario} -
          # then it must mean that current_player won the game.
          if (current_player.history & win_scenario).sort == win_scenario
            game_is_done = true
          end
        end

        if game_is_done == true
          board.display_board
          if current_player.name == "GLaDOS"
            show_cake
          else
            show_fish_tank # Since computer plays perfect game, this shouldn't happen and if it does... its fishy.
          end
          puts "#{current_player.name} won!"
        elsif played_moves == 9 # Game must end within 9 moves.
          board.display_board
          puts "It's a tie!"
          game_is_done = true
        else
          played_moves += 1
          board.display_board
        end
      else # Computer's turn.
        current_player = player2
        location = Computer.move_priority(player1.history, player2.history)
        current_player.history << location
        board.modify_board(current_player, location)
        wining_combos.each do |win_scenario|
          if (current_player.history & win_scenario).sort == win_scenario
            game_is_done = true
          end
        end
        if game_is_done == true
          board.display_board
          if current_player.name == "GLaDOS"
            show_cake
          else
            show_fish_tank # This shouldn't ever happen since computer will always win or cause tie and never lose,
          end              # if it does happen, then something is fishy (player cheated somehow?).
          puts "#{current_player.name} wins the game!"
        elsif played_moves == 9
          board.display_board
          puts "It's a tie!"
          game_is_done = true
        else
          played_moves += 1
          board.display_board
        end
      end
    end
  end
end
