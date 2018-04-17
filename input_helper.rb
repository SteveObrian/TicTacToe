module InputHelper
  SAFE_WORDS = %w[QUIT EXIT].freeze

  def prompt(string)
    print(string + "\n> ")
  end

  def safe_gets
    input = gets
    if SAFE_WORDS.include?(input.chomp.strip.upcase)
      puts 'Goodbye :-)'
      exit
    else
      input
    end
  end
end
