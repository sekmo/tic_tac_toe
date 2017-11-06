require File.expand_path("../game", __FILE__)

game = Game.new
game.board.display
while (game.finished? == false)
  game.do_turn
end
