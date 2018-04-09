require_relative 'game'
require_relative 'player'

players = [
  Player.new('Bob', :X),
  Player.new('Alice', :O)
]

game = Game.new(players)
