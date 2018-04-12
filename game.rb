require_relative 'board'

class Game
  def initialize(players)
    @players = players
    @board = Board.new
  end

  def play_until_end
    current_player, other_player = @players
    until @winner do
      play_turn(current_player)
      current_player, other_player = other_player, current_player
    end
    puts @bord.display
    @winner
  end

  def play_turn(player)
    puts @board.display
    puts "It is #{player.name}'s turn."
    move = player.get_move
    @board[*move]=(player.marker)
    @board.winner?(player)
    @winner = player if @board.winner?(player)
  end
end
