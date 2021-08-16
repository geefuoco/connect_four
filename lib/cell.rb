class Cell

  attr_reader :position , :color
  def initialize(x, y)
    @position = [x, y]
  end

  def update_cell(color)
    unless color == "black" || color == "white" then 
      raise ArgumentError("Enter only black or white")
    end
    @color = color if @color.nil?
  end


end