require 'pry'
require './lib/ship'

class Grid

  attr_reader :matrix,
              :ships,
              :size,
              :owner

  attr_writer :matrix  #TEMPORARY UNTIL HIT OR MISS FUNCTIONALITY IS ADDED

  def initialize(size, owner="Player")
    @owner = owner
    @size = size
    @ships = []
    @matrix = create_matrix
  end

  def create_matrix
    @matrix = Array.new(@size) { Array.new(@size) { "" } }
  end


  def grab_ships(ships)
    ships.each do |ship_name, ship_size|
      @ships.push(Ship.new(ship_name, ship_size))
    end
  end

  def random_coordinates
    x = (0..@size-1).to_a.sample
    y = (0..@size-1).to_a.sample
    return x, y
  end

  def input_coordinates
    # letters = x-axis / columns
    # numbers = y-axis / rows

    # add +1 to all since displayed is 1 through N and array is 0 through N-1

    # error if user inputs number first
    # error if user only inputs one argument
    # error if user does not use a space as their delimiter
    # use the matrix zip from above to come up with a list of valid aft coordinates
    #   if it doesn't match up, give an error
  end

  def coordinates_valid?(coordinates)
    coordinates.each do |x, y|
      return false if x < 0 || x >= @size
      return false if y < 0 || y >= @size
    end
    true
  end

  def coordinates_empty?(coordinates)
    coordinates.each do |x, y|
      return false if @matrix[y][x].class == Ship
    end
    true
  end

  def ship_coordinates(coordinates)
    x_points = coordinates.map { |(x, y)| x }.sort
    y_points = coordinates.map { |(x, y)| y }.sort
    if x_points.uniq.length == 1
      y = (y_points[0]..y_points[-1]).to_a
      x = Array.new(y.length, x_points[0])
    elsif y_points.uniq.length == 1
      x = (x_points[0]..x_points[-1]).to_a
      y = Array.new(x.length, y_points[0])
    end
    x.pop ; x.shift
    y.pop ; y.shift
    coordinates.concat(x.zip(y)).sort
  end

  def place_ship(ship, coordinates)
    coordinates.each do |x, y|
      @matrix[x][y] = ship
    end
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
    (1..@size).map { |i| i.to_s.rjust(2) + display_values(@matrix[i-1]) }
  end

  def display_values(row)
    vals = row.reduce([]) do |vals, col|
      col.class == String ? vals.push(".") : vals.push(col.abbv)
      vals
    end
    " " + vals.join(" ")
  end

end