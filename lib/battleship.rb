require './lib/game'

continue = true

while continue
  battleship = Game.new.play_again?
  continue = battleship
end