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
    @tracking_board = Grid.new(size, "Tracking Board")
  end

  def add_ships_to_board

    @main_board.ships.each do |ship|
      coordinates_valid = false
      until coordinates_valid
        if @ai
          coordinates = @ship.computer_select_coordinates(@main_board.size)
        else
          # coordinates = @ship.human_select_coordinates(@main_board.size)
        end
        coordinates_valid = @main_board.check_ship_placement(ship, coordinates)
      end
    end

  end

  def display_boards
    @tracking_board.display_grid
    @main_board.display_grid
  end






end