require_relative 'game'
require_relative 'player'

players = [
  Player.new('Bob', :X),
  Player.new('Alice', :O)
]

game = Game.new(players)

puts 'Welcome to tic tac toe.'
puts 'It is player one\'s turn.'
game.print_board
puts 'Player one, pick a move.'

p game.play_turn(players[0])
game.print_board
