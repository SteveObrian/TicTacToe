class Board
  WIDTH = 3
  HEIGHT = WIDTH

  def initialize
    @grid = Array.new(HEIGHT) { Array.new(WIDTH,:" ") }
  end

  def winner?(marker)
    row_win?(marker) || column_win?(marker) || diagonal_win?(marker)
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

  def display
    output = "\n"
    output << generate_header
    output << generate_rows
    output << "\n"
  end

  private

  def format_row(row, letter)
    row.reduce("  #{letter} ") { |row, cell| row << "[#{cell}]" } << "\n"
  end

  def generate_header
    (1..WIDTH).reduce("    ") { |header, num| header << " #{num} " }<< "\n"
  end

  def generate_rows
    letter = "@"
    @grid.reduce("") do |output, row|
      letter = letter.next
      output << format_row(row, letter)
    end
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
end
