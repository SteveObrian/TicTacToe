class Board
  WIDTH = 3
  HEIGHT = WIDTH

  def initialize
    @grid = Array.new(HEIGHT) { Array.new(WIDTH,:" ") }
  end

  def display
    @grid.reduce("\n") { |output, row| output << format_row(row) } << "\n"
  end

  def winner?(marker)
    row_win?(marker) || column_win?(marker) || diagonal_win?(marker)
  end

  def row_win?(marker)
    @grid.any? do |row|
      row.all? do |cell|
        cell == marker
      end
    end
  end

  def column_win?(marker)
    (0...WIDTH).any? do |column|
      @grid.all? do |row|
        row[column] == marker
      end
    end
  end

  def diagonal_win?(marker)
    [
      lambda { |i| i },
      lambda { |i| -(i+1) }
    ].any? do |proc|
      (0...HEIGHT).all? do |i|
        #second_index = sign > 0 ? 1 : sign * (i+1)
        @grid[i][proc.(i)] == marker
      end
    end
  end

  def [](y, x)
    @grid[y][x]
  end

  def []=(y, x, value)
    if @grid[y][x] == :" " && [:X, :O].include?(value)
      @grid[y][x] = value
    else
      false
    end
  end

  private
  def format_row(row)
    row.reduce("") { |row_string, cell| row_string << "[#{cell}]" } << "\n"
  end
end

# def print_and_check
#   @b.display
#   puts "Row with all O's?: #{@b.row_win?(:O)}"
#   puts "Row with all X's?: #{@b.row_win?(:X)}"
#   puts "Column with all O's?: #{@b.column_win?(:O)}"
#   puts "Column with all X's?: #{@b.column_win?(:X)}"
#   puts "Diagonal with all O's?: #{@b.diagonal_win?(:O)}"
#   puts "Diagonal with all X's?: #{@b.diagonal_win?(:X)}"
# end
# @b = Board.new
# print_and_check
# @b[0, 2] = :X
# print_and_check
#
# @b[1, 1] = :X
# print_and_check
#
# @b[2, 0] = :X
# print_and_check
