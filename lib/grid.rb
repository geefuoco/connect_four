
require_relative "cell"
require_relative "messanger"

class Grid

  GRID_LENGTH = 7
  GRID_HEIGHT = 6

  attr_reader :cells, :messanger

  def initialize(messanger = Messanger.new)
    @messanger = messanger
    @cells = []
    build_grid
  end


  def update_display
    messanger.display_grid
  end

  def place_token(x, y, color)
    token = cells.select do
      |cell| cell.position[0] == x && cell.position[1] == y
    end
    token = token.first
    token.update_cell(color)
  end

  def get_connected_tokens
    true
            
  end

  private
  def build_grid
    for i in 1..GRID_LENGTH
      for j in 1..GRID_HEIGHT

        @cells << Cell.new(i, j)

      end
    end
  end



end