
class Game

  attr_reader :players, :grid

  def initialize(player, opponent, grid)
    @players = [player, opponent]
    @grid = grid
  end


  def swap_players
    @players = players.rotate
    return players
  end

  def game_over?
    grid.get_connected_tokens
  end

  def welcome
    puts "\e[32mWelcome to Connect Four!\e[0m"
  end

  def verify_input(str)
    str == "1" || str == "2"
  end

  def handle_full_column
    puts "\e[33mThat row is full ! Try again\e[0m"
  end

  def game_loop
    until game_over? 
      grid.print_grid
      puts "\e[36m#{players[0].name}'s turn.\e[0m"
      puts "Input a number from 1-7"
      player_move_full = grid.place_token(players[0].get_move.to_i, players[0].color)
      while player_move_full do
        handle_full_column()
        player_move_full = grid.place_token(players[0].get_move, players[0].color)
      end
      swap_players()
    end
    grid.print_grid

    puts "\e[32mCongrats ! Winner is #{players[0].name}\e[0m!"
  end

  def play_game
    welcome()
    game_loop()
  end


end