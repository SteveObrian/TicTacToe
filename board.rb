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

  def column_win?(marker)
    (0...WIDTH).any? do |column|
      @grid.all? do |row|
        row[column] == marker
      end
    end
  end

  def diagonal_win?

  end
end
def print_and_check
  @b.print_grid
  puts "Row with all O's?: #{@b.row_win?(:O)}"
  puts "Row with all X's?: #{@b.row_win?(:X)}"
  puts "Column with all O's?: #{@b.column_win?(:O)}"
  puts "Column with all X's?: #{@b.column_win?(:X)}"
end
@b = Board.new
print_and_check
@b.grid[0][0] = :O

print_and_check
@b.grid[1][0] = :O

print_and_check
@b.grid[2][0] = :O
print_and_check
