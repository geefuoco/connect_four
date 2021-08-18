

class Grid

  GRID_ROWS = 5
  GRID_COLUMNS = 6
  IGNORE = "\u26AB"

  attr_reader :board

  def initialize()
    @board = []
    build_grid
  end


  def print_grid
    puts
    for i in 0..GRID_ROWS do
      for j in 0..GRID_COLUMNS do
        
        print "  #{@board[i][j]}  "
        
      end
      puts
      puts
    end
    
    print "   1     2     3     4     5     6     7\n"
  end

  def place_token(column, symbol)
    if column > GRID_COLUMNS then
      raise ArgumentError, "Column is outside of grid range (0-6)"
    end
    if !full?(column)
      index = GRID_ROWS
      while index >=0 do
        if @board[index][column] == IGNORE 
          @board[index][column] = symbol
          break
        end
        index -= 1
      end
      return false
    end
    return true
  end

  def full?(index)
    !(board.first[index] == IGNORE)
  end

  def column(column)
    board.map { |cell| cell[column]} 
  end

  def all_columns
    all_columns = []
    GRID_COLUMNS.times { |i| all_columns << column(i) }
    all_columns
  end

  def four_in_row?
    
    win = false
    GRID_ROWS.times do |x|
      4.times do |i|
        win = board.any? do |row|
          (row[i] == row[i+1] && 
          row[i] == row[i+2] && 
          row[i] == row[i+3]) &&
          row[i] != IGNORE
        end
        break if win == true
      end
    end
    return win
  end
  
  def four_in_column?
    
    win = false
    columns = all_columns()
    GRID_COLUMNS.times do |x|
      3.times do |i|
        win = columns.any? do |row|
          (row[i] == row[i+1] && 
          row[i] == row[i+2] && 
          row[i] == row[i+3]) &&
          row[i] != IGNORE
        end
        break if win == true
      end
    end
    return win
  end

  def four_in_diagnol?
    
    win = false
    3.times do |x|
      4.times do |i|
        return true if board[x][i] == board[x+1][i+1] && 
                       board[x][i] == board[x+2][i+2] && 
                       board[x][i] == board[x+3][i+3] &&
                       board[x][i] != IGNORE  
      end
    end
    3.times do |y|
      6.downto(2) do |j|
        return true if board[y][j] == board[y+1][j-1] && 
                       board[y][j] == board[y+2][j-2] && 
                       board[y][j] == board[y+3][j-3] &&
                       board[y][j] != IGNORE
      end
    end

    return win
  end


  def get_connected_tokens
    four_in_column?() || four_in_row?() || four_in_diagnol?()
  end

  private
  def build_grid
    for i in 0..GRID_ROWS
      @board[i] = []
      for j in 0..GRID_COLUMNS
        
        @board[i][j] = "\u26AB" 

      end
    end
  end



end




