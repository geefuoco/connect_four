require_relative "game"
require_relative "player"
require_relative "grid"


grid = Grid.new
player_1 = Player.new("Player 1", "\u26AA")
player_2 = Player.new("Player 2", "\u2650")
game = Game.new(player_1, player_2, grid)

game.play_game