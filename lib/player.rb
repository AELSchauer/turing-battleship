require './lib/grid'
require 'pry'

class Player

  def initialize(name, player_is_ai)
    @name = name
    @ai = player_is_ai
  end

  def board_setup(size, ships)
    @main_board = Grid.new(size, "Main Board")
    @main_board.get_ships(ships)
    @main_board.place_ships_on_board(@ai)
    @tracking_board = Grid.new(size, "Tracking Board")
  end

  # def place_ships_on_board
  #   @main_board.ships.each do |ship|
  #     coordinates_valid = false
  #     until coordinates_valid
  #       # coordinates = @ai ? @main_board.random_coordinates : @main_board.input_coordinates
  #       if @ai
  #         coordinates = @main_board.random_coordinates
  #       else
  #         # coordinates = @main_board.input_coordinates
  #       end
  #       coordinates_valid = @main_board.check_ship_placement(ship, coordinates)
  #     end
  #     @main_board.place_object(ship, coordinates)
  #   end
  # end

  def display_boards
    @tracking_board.display_grid
    @main_board.display_grid
  end

end