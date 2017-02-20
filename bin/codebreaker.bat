@"ruby.exe" "%~dpn0" %*
require 'codebreaker'

game = Codebreaker::Game.new(STDOUT)
game.start
