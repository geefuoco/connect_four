class Player

  attr_reader :name, :color

  def initialize(name="Player", color)
    @name = name
    @color = color
  end

  def get_move
    loop do
      input = gets.to_s.chomp
      break if valid_input(input)
    end

  end
  
  def valid_input(input)
    true if input.to_s.match(/^[0-6]$/)
  end

end