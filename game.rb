require_relative 'board'

class Game
  def initialize(players)
    @players = players
    @board = Board.new
  end

  def play_turn(player)
    #TODO: Get a move from player one.
    move = player.get_move
    #TODO: Mark that place on the board
    @board[*move]=(player.marker)
    #TODO: Check for a winner
    @board.winner?(player.marker)
  end

  def print_board
    @board.print_grid
  end
end
