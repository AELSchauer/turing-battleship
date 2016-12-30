require 'pry'
require './lib/user_input'

class CoordinatesGenerator

  attr_reader :coordinates

  def initialize(grid_size, coordinates=nil)
    @grid_size = grid_size - 1
    @coordinates = coordinates
  end

  def human_declare_firing_coordinates
    @coordinates = get_string_input(1)
  end

  def human_declare_ship_coordinates(ship_size)
    @ship_size = ship_size
    @coordinates = get_string_input(2)
    return false unless @coordinates
    return false unless list_aft_coordinates.include?(@coordinates[1])
    add_mid_ship_coordinates
    @coordinates
  end

  def computer_declare_firing_coordinates
    if @coordinates.nil?
      @coordinates = random_coordinates
    else
      human_declare_firing_coordinates
    end
    @coordinates
  end

  def computer_declare_ship_coordinates(ship_size)
    @ship_size = ship_size
    if @coordinates.nil?
      @coordinates = [random_coordinates]
      get_aft_coordinates
      add_mid_ship_coordinates
    else
      human_declare_ship_coordinates(ship_size)
    end
    @coordinates
  end

  def get_string_input(n)
    input = UserInput.new(@coordinates).coordinate_selection(n)
    return false unless input
    coordinates = extract_coordinates(input)
    return false unless coordinates_valid?(coordinates)
    coordinates
  end

  def extract_coordinates(input)
    new_coordinates = []
    input.each_with_index do |e, i|
      c = input[i][0].ord - 65
      r = input[i][1..-1].to_i - 1
      new_coordinates.push([r, c])
    end
    new_coordinates
  end

  def coordinates_valid?(coordinates=nil)
    coordinates = @coordinates if coordinates.nil?
    coordinates.each do |r, c|
      return false if r < 0 || r > @grid_size
      return false if c < 0 || c > @grid_size
    end
    coordinates
  end

  def list_aft_coordinates
    s = @ship_size - 1
    x, y = @coordinates[0]
    [x-s, x, x+s, x].zip([y, y-s, y, y+s])
  end

  def add_mid_ship_coordinates
    r_points = @coordinates.map { |(r, c)| r }.sort
    c_points = @coordinates.map { |(r, c)| c }.sort
    if r_points.uniq.length == 1
      c = (c_points[0]..c_points[-1]).to_a
      r = Array.new(c.length, r_points[0])
    elsif c_points.uniq.length == 1
      r = (r_points[0]..r_points[-1]).to_a
      c = Array.new(r.length, c_points[0])
    end
    r.pop ; r.shift
    c.pop ; c.shift
    @coordinates.concat(r.zip(c)).sort!
  end

  def get_aft_coordinates
    while true
      aft_coordinates = list_aft_coordinates.sample
      @coordinates.push(aft_coordinates)
      break if coordinates_valid?
      @coordinates.pop
    end
  end

  def random_coordinates
    x = (0..@grid_size).to_a.sample
    y = (0..@grid_size).to_a.sample
    return [x, y]
  end

end