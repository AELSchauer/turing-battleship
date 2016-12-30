require 'pry'
require './lib/message'
require './lib/ship'
require './lib/peg'
require './lib/coordinates_generator'
require './lib/grid_display'

class Grid
  include GridDisplay

  attr_reader :matrix,
              :ships,
              :size

  attr_writer :matrix  #TEMPORARY UNTIL HIT OR MISS FUNCTIONALITY IS ADDED

  def initialize(size, type, player_ai)
    @player_ai  = player_ai
    @type       = type
    @size       = size
    @ships      = []
    @matrix     = create_matrix
  end

  def create_matrix
    @matrix = Array.new(@size) { Array.new(@size) { Peg.new } }
  end

  def grab_ships(ships)
    ships.each do |ship_name, ship_size, coordinates|
      @ships.push(Ship.new(ship_name, ship_size, coordinates))
    end
  end

  def get_ship_coordinates(ship)
    # are the ship coordinates nil? (no testing input)
      # if yes, generate ship coordinates (input from user or random for computer)
      # if no, those coordinates should be a string input
    # is there already a ship at those coordinates?
      # if yes, set ship coordinates to nil, give error message, and return false to run again
      # if no, return the coordinates
    if ship.coordinates.nil?
      generator = CoordinatesGenerator.new(@size)
    else
      generator = CoordinatesGenerator.new(@size, ship.coordinates)
    end
    if @player_ai
      generator.computer_declare_ship_coordinates(ship.size)
    else
      Message.player_ship_placement(ship, self)
      generator.human_declare_ship_coordinates(ship.size)
    end
    if coordinates_empty?(generator.coordinates)
      generator.coordinates
    else
      ship.coordinates = nil
      Message.coordinates_not_empty
      false
    end

  end

  def place_ships_on_board
    @ships.each do |ship|
      coordinates = get_ship_coordinates(ship)
      until coordinates
        coordinates = get_ship_coordinates(ship)
      end
      place_object(ship, coordinates)
    end
  end

  def coordinates_empty?(coordinates)
    return false unless coordinates
    return false if coordinates.class == String
    coordinates.each do |r, c|
      return false unless @matrix[r][c].abbv == "."
    end
    true
  end

  def place_object(object, coordinates)
    coordinates.each { |x, y| @matrix[x][y] = object }
  end

  # def hit_or_miss(row, col)
  #   case @matrix[row][col]
  #   when "H", "M"
  #     false
  #   when "."
  #     "miss"
  #   when .class == Node
  #     "hit"
  #   end
  # end

end