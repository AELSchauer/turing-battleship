require 'pry'
require './lib/ship'
require './lib/peg'

class Grid

  attr_reader :matrix,
              :ships,
              :size

  attr_writer :matrix  #TEMPORARY UNTIL HIT OR MISS FUNCTIONALITY IS ADDED

  def initialize(size, type)
    @type = type
    @size = size
    @ships = []
    @matrix = create_matrix
  end

  def create_matrix
    @matrix = Array.new(@size) { Array.new(@size) { Peg.new } }
  end


  def grab_ships(ships)
    ships.each do |ship_name, ship_size|
      @ships.push(Ship.new(ship_name, ship_size))
    end
  end

  def place_ships_on_board(player_ai)
    @ships.each do |ship|
      coordinates_valid = false
      until coordinates_valid
        # coordinates = @ai ? @main_board.random_coordinates : @main_board.input_coordinates
        if player_ai
          coordinates = random_coordinates
        else
          coordinates = @main_board.input_coordinates
        end
        coordinates_valid = @main_board.check_ship_placement(ship, coordinates)
      end
      @main_board.place_object(ship, coordinates)
    end
  end

  def random_coordinates
    x = (0..@size-1).to_a.sample
    y = (0..@size-1).to_a.sample
    return x, y
  end

  def input_coordinates
    # letters = columns
    # numbers = rows

    input = UserInput.new.coordinate_selection(@size, 1)

    # add +1 to all since displayed is 1 through N and array is 0 through N-1
    # use the matrix zip from above to come up with a list of valid aft coordinates
    #   if it doesn't match up, give an error
  end

  # def valid?(input)
  #   return false unless input.scan(/[^A-Z1-#{@size} ]/).empty?
  #   return false if input.scan(/[A-Z][1-#{@size}]/).empty?
  #   return false unless input.scan(/[A-Z][1-#{@size}]/).length < 3
  #   input.scan(/[A-Z][1-#{@size}]/)
  # end

  def coordinates_valid?(coordinates)
    coordinates.each do |r, c|
      return false if r < 0 || r >= @size
      return false if c < 0 || c >= @size
    end
    true
  end

  def coordinates_empty?(coordinates)
    coordinates.each do |r, c|
      return false unless @matrix[r][c].abbv == "."
    end
    true
  end

  def ship_coordinates(coordinates)
    r_points = coordinates.map { |(r, c)| r }.sort
    c_points = coordinates.map { |(r, c)| c }.sort
    if r_points.uniq.length == 1
      c = (c_points[0]..c_points[-1]).to_a
      r = Array.new(c.length, r_points[0])
    elsif c_points.uniq.length == 1
      r = (r_points[0]..r_points[-1]).to_a
      c = Array.new(r.length, c_points[0])
    end
    r.pop ; r.shift
    c.pop ; c.shift
    coordinates.concat(r.zip(c)).sort
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

# end

# class GridDisplay

#   def initialize(grid)
#     @grid   = grid
#     @matrix = grid.matrix
#     @size   = grid.size
#   end

  def display_grid
    display_grid =
      [ outline,
        column_labels,
        row_labels_and_values,
        outline
      ]
    display_grid.flatten.join("\n")
  end

  def outline
    "=" * ((@size * 2) + 4)
  end

  def column_labels
    "  " + (1..@size).map { |i| " #{(i+64).chr}" }.join
  end

  def row_labels_and_values
    (1..@size).map { |i| i.to_s.rjust(2) + display_values(i-1) }
  end

  def display_values(r)
    @matrix[r].map { |c| " #{c.abbv}" }.join
  end

end

class UserInput

  def initialize(input=nil)
    @input = input.nil? ? get_input : input
  end

  # def start_menu

  # end

  # def start_menu_valid?

  # end

  # def difficulty_selection

  # end

  # def difficulty_selection_valid?

  # end

  def get_input
    gets.upcase.gsub!("\n","")
  end

  def coordinate_selection(size, number_needed)
    return false unless coordinate_all_characters_valid?(size)
    valid_sets = coordinate_scan_for_valid_sets
    return false unless valid_sets.length == number_needed
    valid_sets
  end

  def coordinate_all_characters_valid?(size)
    return false unless @input.scan(/[^A-Z1-#{size} ]/).empty?
    true
  end

  def coordinate_scan_for_valid_sets
    @input.scan(/[A-Z][1-#{@size}]/)
  end


end