require_relative 'input_helper'

class Player
  include InputHelper

  ROW_MAP = (:A..:C).zip(0..2).to_h

  attr_reader :marker, :name, :score

  def initialize(name, marker)
    @name = name
    @marker = marker
    @score = 0
  end

  def increment_score
    @score += 1
  end

  def get_move
    [get_row, get_col]
  end

  def get_row
    loop do
      prompt('Pick a row.')
      input = safe_gets
      choice = translate_row(input)
      return choice if in_range_of?(choice)
      puts 'Invalid row.'
    end
  end

  def get_col
    loop do
      prompt('Pick a column.')
      input = safe_gets
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

  def in_range_of?(choice)
    (0..2).cover?(choice)
  end
end
