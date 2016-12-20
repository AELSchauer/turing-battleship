require 'simplecov'
SimpleCov.start

require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/grid'
require './lib/ship'
require './lib/peg'

class GridTest < Minitest::Test

  def test_exists
    # skip
    assert true
  end

  def test_grid_exists
    # skip
    grid = Grid.new(4, "Main Board")

    assert                  grid
    assert_equal 4,         grid.size
  end

  def test_create_matrix
    # skip
    grid = Grid.new(4, "Main Board")

    grid_test = grid.create_matrix

    assert_equal 4,   grid_test.length
    assert_equal 4,   grid_test[0].length
    assert_equal Peg, grid_test[rand(0..3)][rand(0..3)].class
  end

  def test_create_matrix_automatically
    # skip
    grid = Grid.new(4, "Main Board")

    assert_equal 4,   grid.matrix.length
    assert_equal 4,   grid.matrix[0].length
    assert_equal Peg, grid.matrix[rand(0..3)][rand(0..3)].class
  end

  def test_outline_below_9
    # skip
    grid = Grid.new(4, "Main Board")

    line = "=" * 12

    assert_equal line, grid.outline
  end

  def test_outline_above_9
    # skip
    grid = Grid.new(12, "Main Board")

    line = "=" * 28

    assert_equal line, grid.outline
  end

  def test_column_labels_below_9
    # skip
    grid = Grid.new(4, "Main Board")

    labels = "   A B C D"

    assert_equal labels, grid.column_labels
  end

  def test_column_labels_above_9
    # skip
    grid = Grid.new(12, "Main Board")

    labels = "   A B C D E F G H I J K L"

    assert_equal labels, grid.column_labels
  end

  def test_grid_values_below_9
    # skip
    grid = Grid.new(4, "Main Board")
    vals = " ." * 4

    assert_equal vals, grid.display_values(1)
  end

  def test_grid_values_above_9
    # skip
    grid = Grid.new(12, "Main Board")
    vals = " ." * 12

    assert_equal vals, grid.display_values(1)
  end

  def test_display_grid_values_empty   # update this test once hit or miss functionality has been added
    # skip
    grid = Grid.new(6, "Main Board")
    vals = " . . . . . ."

    assert_equal vals, grid.display_values(1)
  end

  def test_display_grid_values_with_hits_and_misses   # update this test once hit or miss functionality has been added
    # skip
    grid = Grid.new(6, "Main Board")
    grid.matrix[1][2] = Peg.new("Hit")
    grid.matrix[1][4] = Peg.new("Miss")
    vals = " . . H . M ."

    assert_equal vals, grid.display_values(1)
  end

  def test_row_labels_and_values_below_9
    # skip
    grid = Grid.new(4, "Main Board")
    vals = []
    vals.push(" 1 . . . .")
    vals.push(" 2 . . . .")
    vals.push(" 3 . . . .")
    vals.push(" 4 . . . .")

    assert_equal vals, grid.row_labels_and_values
  end

  def test_display_matrix_small
    # skip
    grid = Grid.new(4, "Main Board")
    grid_string =
      "============" + "\n" +
      "   A B C D"   + "\n" +
      " 1 . . . ."   + "\n" +
      " 2 . . . ."   + "\n" +
      " 3 . . . ."   + "\n" +
      " 4 . . . ."   + "\n" +
      "============"

    assert_equal grid_string, grid.display_grid
  end

  def test_display_matrix_large
    # skip
    grid = Grid.new(12, "Main Board")
    grid_string =
      "============================" + "\n" +
      "   A B C D E F G H I J K L"   + "\n" +
      " 1 . . . . . . . . . . . ."   + "\n" +
      " 2 . . . . . . . . . . . ."   + "\n" +
      " 3 . . . . . . . . . . . ."   + "\n" +
      " 4 . . . . . . . . . . . ."   + "\n" +
      " 5 . . . . . . . . . . . ."   + "\n" +
      " 6 . . . . . . . . . . . ."   + "\n" +
      " 7 . . . . . . . . . . . ."   + "\n" +
      " 8 . . . . . . . . . . . ."   + "\n" +
      " 9 . . . . . . . . . . . ."   + "\n" +
      "10 . . . . . . . . . . . ."   + "\n" +
      "11 . . . . . . . . . . . ."   + "\n" +
      "12 . . . . . . . . . . . ."   + "\n" +
      "============================"

    assert_equal grid_string, grid.display_grid
  end

  def test_coordinates_valid
    # skip
    grid = Grid.new(6, "Main Board")
    ship = Ship.new("Submarine", 3)
    coordinates = [[1, 3], [3, 3]]

    assert_equal true, grid.coordinates_valid?(coordinates)
  end

  def test_coordinates_not_valid
    # skip
    grid = Grid.new(6, "Main Board")
    ship = Ship.new("Submarine", 3)
    coordinates = [[1, 3], [-1, 3]]

    assert_equal false, grid.coordinates_valid?(coordinates)
  end

  def test_ship_coordinates_horizontal_forward
    # skip
    grid = Grid.new(6, "Main Board")
    coordinates = [[1, 3], [4, 3]]

    expected_coordinates  = [[1, 3], [2, 3], [3, 3], [4, 3]]
    actual_coordinates    = grid.ship_coordinates(coordinates)

    assert_equal expected_coordinates, actual_coordinates
  end

  def test_ship_coordinates_horizontal_backward
    # skip
    grid = Grid.new(6, "Main Board")
    coordinates = [[4, 3], [1, 3]]

    expected_coordinates  = [[1, 3], [2, 3], [3, 3], [4, 3]]
    actual_coordinates    = grid.ship_coordinates(coordinates)

    assert_equal expected_coordinates, actual_coordinates
  end

  def test_ship_coordinates_vertical_forward
    # skip
    grid = Grid.new(6, "Main Board")
    coordinates = [[3, 1], [3, 4]]

    expected_coordinates  = [[3, 1], [3, 2], [3, 3], [3, 4]]
    actual_coordinates    = grid.ship_coordinates(coordinates)

    assert_equal expected_coordinates, actual_coordinates
  end

  def test_ship_coordinates_vertical_backward
    # skip
    grid = Grid.new(6, "Main Board")
    coordinates = [[3, 4], [3, 1]]

    expected_coordinates = [[3, 1], [3, 2], [3, 3], [3, 4]]
    actual_coordinates   = grid.ship_coordinates(coordinates)

    assert_equal expected_coordinates, actual_coordinates
  end

  def test_coordinates_empty
    # skip
    grid = Grid.new(6, "Main Board")
    coordinates_s1 = [[1, 3], [4, 3]]
    coordinates_s2 = [[3, 1], [3, 4]]

    coordinates_l1 = grid.ship_coordinates(coordinates_s1)
    coordinates_l2 = grid.ship_coordinates(coordinates_s2)

    assert_equal true, grid.coordinates_empty?(coordinates_l1)
    assert_equal true, grid.coordinates_empty?(coordinates_l2)
  end

  def test_coordinates_not_empty
    # skip
    grid = Grid.new(6, "Main Board")
    ship = Ship.new("Battleship", 4)
    grid.matrix[3][3] = ship
    coordinates_s1 = [[3, 1], [3, 4]]

    coordinates_l1 = grid.ship_coordinates(coordinates_s1)

    assert_equal false, grid.coordinates_empty?(coordinates_l1)
  end

  def test_add_ships
    # skip
    grid = Grid.new(12, "Main Board")
    ships = [ ["Destroyer",   2],
              ["Cruiser",     3],
              ["Battleship",  4],
              ["Carrier",     5]
            ]

    grid.grab_ships(ships)

    assert_equal "Destroyer",   grid.ships[0].name
    assert_equal "Cruiser",     grid.ships[1].name
    assert_equal "Battleship",  grid.ships[2].name
    assert_equal "Carrier",     grid.ships[3].name
  end

  def test_place_ship
    # skip
    grid = Grid.new(6, "Main Board")
    ship = Ship.new("Destroyer", 4)
    coordinates = grid.ship_coordinates([[3, 1], [3, 4]])
    grid_string =
      "================" + "\n" +
      "   A B C D E F"   + "\n" +
      " 1 . . . . . ."   + "\n" +
      " 2 . . . . . ."   + "\n" +
      " 3 . . . . . ."   + "\n" +
      " 4 . D D D D ."   + "\n" +
      " 5 . . . . . ."   + "\n" +
      " 6 . . . . . ."   + "\n" +
      "================"

    grid.place_object(ship, coordinates)

    assert_equal grid.display_grid, grid_string
  end

  def test_input_coordinates
    skip
    grid = Grid.new(6, "Main Board")

    input = grid.input_coordinates

    assert input
  end

  def test_reg_ex
    skip
    grid = Grid.new(6, "Main Board")
    input = "A1,A9"

    valid = grid.reg_ex(input)

    p valid

  end

  def test_valid_true
    skip
    grid = Grid.new(6, "Main Board")
    input = "A"

    valid = grid.valid?(input)

    puts valid

    assert valid

  end

  # def test_valid_false
  #   # skip
  #   grid = Grid.new(6, "Main Board")
  #   input_1 = "A"
  #   input_2 = "A0"
  #   input_3 = "A1?"
  #   input_4 = "A1,A2"
  #   input_5 = "A1;A2"
  #   input_6 = "A7"

  #   valid_1 = grid.valid?(input_1)
  #   valid_2 = grid.valid?(input_2)
  #   valid_3 = grid.valid?(input_3)
  #   valid_4 = grid.valid?(input_4)
  #   valid_5 = grid.valid?(input_5)
  #   valid_6 = grid.valid?(input_6)

  #   refute valid_1
  #   refute valid_2
  #   refute valid_3
  #   refute valid_4
  #   refute valid_5
  #   refute valid_6
  # end

  def test_valid_false
    # skip
    grid = Grid.new(6, "Main Board")
    input_1 = "A"
    input_2 = "A0"
    input_3 = "A1?"
    input_4 = "A1,A2"
    input_5 = "A1;A2"
    input_6 = "A7"

    valid_1 = grid.input_coordinates(input_1)
    valid_2 = grid.input_coordinates(input_2)
    valid_3 = grid.input_coordinates(input_3)
    valid_4 = grid.input_coordinates(input_4)
    valid_5 = grid.input_coordinates(input_5)
    valid_6 = grid.input_coordinates(input_6)

    refute valid_1
    refute valid_2
    refute valid_3
    refute valid_4
    refute valid_5
    refute valid_6
  end

  # def test_parse_coordinates_single
  #   grid = Grid.new(6, "Main Board")
  #   input = "A1"

  #   number = grid.parse_coordinates(input).count

  #   assert_equal 1, number
  # end

  # def test_parse_coordinates_multiple
  #   grid = Grid.new(6, "Main Board")
  #   input = "A1 A2"

  #   number = grid.parse_coordinates(input).count

  #   assert_equal 2, number
  # end

  # def test_parse_coordinates
  #   skip
  #   grid = Grid.new(6, "Main Board")
  #   input = "A1 A2"

  #   number = grid.parse_coordinates(input).count

  #   assert_equal 2, number
  # end

  # def test_all_valid_start_letter
  #   skip
  #   grid = Grid.new(6, "Main Board")
  #   input_1 = grid.parse_coordinates("A1")
  #   input_2 = grid.parse_coordinates("A2 A3")

  #   assert grid.all_valid?(input_1)
  #   assert grid.all_valid?(input_2)
  # end

  # def test_all_valid_not_start_letter
  #   skip
  #   grid = Grid.new(6, "Main Board")
  #   input_1 = grid.parse_coordinates("11")
  #   input_2 = grid.parse_coordinates("12 A3")
  #   input_3 = grid.parse_coordinates("A2 13")
  #   input_4 = grid.parse_coordinates("12 13")

  #   refute grid.all_valid?(input_1)
  #   refute grid.all_valid?(input_2)
  #   refute grid.all_valid?(input_3)
  #   refute grid.all_valid?(input_4)
  # end


  # The process of setting up the board for the computer:
  # 1) Create the main board
  # 2) Grab the first ship.
  # 3) Find the bow coordinates & position for the first ship.
  # 4) If the coordinates will have the ship go outside the grid
  #     or overlap with another ship, go back to step 3.
  # 5) If the bow coordinates are good, add the ship to the grid.
  # 6) Repeat steps 2 through 4 for the rest of ths ships.


end
