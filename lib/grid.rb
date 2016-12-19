require "pry"

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
    cols = get_hash("A")
    get_hash(1,cols)
  end

  def get_hash(character, value=".")
    @size.times.reduce({}) do |h|
      h[character] = value
      character = character.next
      h
    end
  end

  def place_ship(ship, *coordinates)
    coordinates = coordinates_selection if coordinates.empty?
    row, col, pos = coordinates
    return false unless check_ship_placement(ship, row, col, pos)
    true
    # unless check_ship_placement(ship, row, col, pos)
    #   place_ship(ship)
    # end

  end

  def coordinates_selection
    row = @matrix.keys.sample
    col = @matrix[row].keys.sample
    pos = ["h","v"].sample
    return row, col, pos
  end

  def check_ship_placement(ship, row, col, pos)
    ship.size.times do |i|
      if pos == "v"
        return false if @matrix[row+i].nil?
        return false unless @matrix[row+i][col] == "."
      elsif pos == "h"
        return false if @matrix[row][(col.ord+i).chr].nil?
        return false unless @matrix[row][(col.ord+i).chr] == "."
      end
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