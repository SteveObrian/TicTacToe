require_relative 'board'

class Game
  def initialize(players)
    @players = players
    @board = Bord.new
  end
end
