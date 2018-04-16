require_relative 'game'
require_relative 'player'

class Session
  def initialize
    puts 'Welcome to tic tac toe.'
    @players = [
      Player.new('Bob', :X),
      Player.new('Alice', :O)
    ]
    play_a_game
  end

  def play_a_game
    game = Game.new(@players)
    winner = game.play_until_end
    if winner
      puts "#{winner.name} won!"
    else
      puts 'The game was a tie!'
    end

  end
end
