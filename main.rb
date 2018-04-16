require_relative 'game'
require_relative 'player'

players = [
  Player.new('Bob', :X),
  Player.new('Alice', :O)
]

game = Game.new(players)

puts 'Welcome to tic tac toe.'
winner = game.play_until_end
puts "#{winner.name} won!" if winner
