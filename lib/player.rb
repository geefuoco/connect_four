class Player

  attr_reader :name, :color

  def initialize(name="Player", color)
    @name = name
    @color = color
  end

  def get_move
    input = nil
    loop do
      input = gets.to_s.chomp
      break if valid_input(input)
    end
    input
  end
  
  def valid_input(input)
    return true if input.to_s.match(/^[1-7]$/)
    puts "\e[32mPlease enter a valid input\e[0m"
  end

end