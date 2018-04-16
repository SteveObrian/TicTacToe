require_relative 'game'
require_relative 'player'

class Session
  def initialize
    puts 'Welcome to tic tac toe.'
    @players = [
      Player.new('Bob', :X),
      Player.new('Alice', :O)
    ]
    @ties = 0
    play_loop
  end

  private

  def play_loop
    puts 'Welcome to tic tac toe.'
    loop do
      puts 'Starting a new game!'
      game = Game.new(@players)
      @last_winner = game.winner
      update_scores
      puts display_scores
      break unless play_again?
    end
    puts 'goodbye'
  end

  def play_again?
    print "Play again?(y/n)\n> "
    loop do
      answer = gets.strip[0].upcase
      case answer
      when 'Y'
        return true
      when 'N'
        return false
      else
        print "What was that? (type y or n)\n> "
      end
    end
  end

  def update_scores
    @last_winner ? @last_winner.increment_score : @ties += 1
  end

  def announced_winner
    @last_winner ? "#{@last_winner.name} won!" : 'The game was a tie!'
  end

  def display_scores
    scores_array = [
      announced_winner,
      '',
      "The score after #{games_played} games"
    ]
    scores_array.concat(
      @players.map { |player| "#{player.name} has won #{player.score} times" }
    )
    scores_array <<
      "#{@players[0].name} and #{@players[1].name} have tied #{@ties} times"
    scores_array <<
      ''
  end

  def games_played
    @ties + @players.reduce(0) { |total, player| total + player.score }
  end
end
