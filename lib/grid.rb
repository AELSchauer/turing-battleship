require './lib/ship'
require 'pry'

class Grid

  attr_reader :matrix,
              :ships,
              :size

  attr_writer :matrix  #TEMPORARY UNTIL HIT OR MISS FUNCTIONALITY IS ADDED

  def initialize(size, owner="Player")
    @owner = owner
    @size = size
    @ships = []
    @matrix = create_matrix
  end

  def create_matrix
    cols = get_hash
    get_hash(cols)
  end

  def get_hash(value="")
    key = 0
    @size.times.reduce({}) do |h|
      h[key += 1] = value
      h
    end
  end

  def place_ship(ship)

  end

  def coordinates_valid?(coordinates)
    coordinates.each do |x, y|
      return false if @matrix[y].nil?
      return false if @matrix[y][x].nil?
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

  def coordinates_empty?(coordinates)
    coordinates.each do |x, y|
      return false if @matrix[y][x].class == Ship
    end
    true
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

  def add_ships(ships)
    ships.each do |ship_name, ship_size|
      @ships.push(Ship.new(ship_name, ship_size))
    end
  end

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
    @matrix.keys.sort.map { |row| row.to_s.rjust(2) + display_values(row) }
  end

  def display_values(row)
    row = @matrix[row]
    " " + row.keys.sort.map { |key| row[key] }.join(" ")
  end

end