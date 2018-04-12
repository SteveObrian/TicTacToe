class Player
  ROW_MAP = (:A..:C).zip(0..2).to_h

  attr_reader :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
    @score = 0
  end

  def get_move
    [get_row, get_col]
  end

  def get_row
    loop do
      choice_prompt('row')
      input = gets
      choice = translate_row(input)
      return choice if in_range_of?(choice)
      puts 'Invalid row.'
    end
  end

  def get_col
    loop do
      choice_prompt('column')
      input = gets
      choice = translate_column(input)
      return choice if in_range_of?(choice)
      puts 'Invalid column.'
    end
  end

  def translate_row(input)
    ROW_MAP[input[0].upcase.to_sym]
  end

  def translate_column(input)
    input.to_i - 1
  end

  def choice_prompt(string)
    puts "Pick a #{string}."
    print '> '
  end

  def in_range_of?(choice)
    (0..2).include?(choice)
  end
end
