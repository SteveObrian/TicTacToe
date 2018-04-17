require_relative 'game'
require_relative 'player'

class Session
  def initialize
    puts 'Welcome to tic tac toe.'
    @players = [
      create_player(:X),
      create_player(:O)
    ]
    @ties = 0
    play_loop
    puts 'Goodbye'
  end

  private

def create_player(marker)
  print "Who will play as #{marker}?\n> "
  name = gets.chomp.strip
  Player.new(name, marker)
end

  def play_loop
    loop do
      game = Game.new(games_played.even? ? @players : @players.reverse)
      update_scores(game.winner)
      puts display_scores
      break unless play_again?
    end
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

  def update_scores(winner)
    winner ? winner.increment_score : @ties += 1
  end

  def display_scores
    scores_array = [
      '',
      "The score after #{games_played} game#{handle_plural(games_played)} :"
    ]
    scores_array.concat(
      @players.map do |a|
        "#{a.name} has won #{a.score} time#{handle_plural(games_played)}"
      end
    )
    scores_array <<
      "#{@players[0].name} and #{@players[1].name} have tied #{@ties} " \
      "time#{handle_plural(games_played)}"
    scores_array <<
      ''
  end

  def games_played
    @ties + @players.reduce(0) { |total, player| total + player.score }
  end

  def handle_plural(value)
    's' unless value == 1
  end
end
