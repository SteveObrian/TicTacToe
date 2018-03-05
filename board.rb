class Board
  WIDTH = 3
  HEIGHT = WIDTH
  attr_accessor :grid

  def initialize
    @grid = Array.new(HEIGHT) { Array.new(WIDTH,:" ") }
  end

  def print_grid
    @grid.each do |row|
      puts
      row.each do |cell|
        print "[#{cell}]"
      end
    end
    puts
  end

  def row_win?(marker)
    @grid.any? do |row|
      row.all? do |cell|
        cell == marker
      end
    end
  end

  def column_win?

  end

  def diagonal_win?

  end
end
def print_and_check
  @b.print_grid
  p @b.row_win?(:O)
  p @b.row_win?(:X)
end
@b = Board.new
print_and_check
@b.grid[0][0] = :O

print_and_check
@b.grid[0][1] = :O

print_and_check
@b.grid[0][2] = :O
print_and_check
