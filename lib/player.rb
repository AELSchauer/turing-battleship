require './lib/grid'
require 'pry'

class Player

  def initialize(name, player_is_ai)
    @name = name
    @ai = player_is_ai
  end

  def board_setup(size, ships)
    @main_board = Grid.new(size, "Main Board", @ai)
    @main_board.grab_ships(ships)
    @main_board.place_ships_on_board
    @tracking_board = Grid.new(size, "Tracking Board", @ai)
  end

  def display_boards
    @tracking_board.display_grid
    @main_board.display_grid
  end

end