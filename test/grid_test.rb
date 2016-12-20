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
    grid = Grid.new(4)

    assert                  grid
    assert_equal 4,         grid.size
    assert_equal "Player",  grid.owner
  end

  def test_create_matrix
    # skip
    grid = Grid.new(4)
    grid_layout =
      [ ["","","",""],
        ["","","",""],
        ["","","",""],
        ["","","",""]
      ]

    grid_test = grid.create_matrix

    assert_equal grid_layout, grid_test
  end

  def test_create_grid_automatically
    # skip
    grid = Grid.new(4)
    grid_layout =
      [ ["","","",""],
        ["","","",""],
        ["","","",""],
        ["","","",""]
      ]

    assert_equal grid_layout, grid.matrix
  end

  def test_outline_below_9
    # skip
    grid = Grid.new(4)

    line = "=" * 12

    assert_equal line, grid.outline
  end

  def test_outline_above_9
    # skip
    grid = Grid.new(10)

    line = "=" * 24

    assert_equal line, grid.outline
  end

  def test_column_labels_below_9
    # skip
    grid = Grid.new(4)

    labels = "   A B C D"

    assert_equal labels, grid.column_labels
  end

  def test_column_labels_above_9
    # skip
    grid = Grid.new(10)

    labels = "   A B C D E F G H I J"

    assert_equal labels, grid.column_labels
  end

  def test_grid_values_below_9
    # skip
    grid = Grid.new(4)
    vals = " ." * 4

    assert_equal vals, grid.display_values(grid.matrix[1])
  end

  def test_grid_values_above_9
    # skip
    grid = Grid.new(11)
    vals = " ." * 11

    assert_equal vals, grid.display_values(grid.matrix[1])
  end

  def test_grid_values_with_hits_and_misses   # update this test once hit or miss functionality has been added
    # skip
    grid = Grid.new(6)
    grid.matrix[1][2] = Peg.new("Hit")
    grid.matrix[1][4] = Peg.new("Miss")
    vals = " . . H . M ."

    assert_equal vals, grid.display_values(grid.matrix[1])
  end

  def test_row_labels_and_values_below_9
    # skip
    grid = Grid.new(4)
    vals = []
    vals.push(" 1 . . . .")
    vals.push(" 2 . . . .")
    vals.push(" 3 . . . .")
    vals.push(" 4 . . . .")

    assert_equal vals, grid.row_labels_and_values
  end

  def test_display_matrix_small
    # skip
    grid = Grid.new(4)
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
    grid = Grid.new(12)
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
    grid = Grid.new(6)
    ship = Ship.new("Submarine", 3)
    coordinates = [[1, 3], [3, 3]]

    assert_equal true, grid.coordinates_valid?(coordinates)
  end

  def test_coordinates_not_valid
    # skip
    grid = Grid.new(6)
    ship = Ship.new("Submarine", 3)
    coordinates = [[1, 3], [-1, 3]]

    assert_equal false, grid.coordinates_valid?(coordinates)
  end

  def test_ship_coordinates_horizontal_forward
    # skip
    grid = Grid.new(6)
    coordinates = [[1, 3], [4, 3]]

    expected_coordinates  = [[1, 3], [2, 3], [3, 3], [4, 3]]
    actual_coordinates    = grid.ship_coordinates(coordinates)

    assert_equal expected_coordinates, actual_coordinates
  end

  def test_ship_coordinates_horizontal_backward
    # skip
    grid = Grid.new(6)
    coordinates = [[4, 3], [1, 3]]

    expected_coordinates  = [[1, 3], [2, 3], [3, 3], [4, 3]]
    actual_coordinates    = grid.ship_coordinates(coordinates)

    assert_equal expected_coordinates, actual_coordinates
  end

  def test_ship_coordinates_vertical_forward
    # skip
    grid = Grid.new(6)
    coordinates = [[3, 1], [3, 4]]

    expected_coordinates  = [[3, 1], [3, 2], [3, 3], [3, 4]]
    actual_coordinates    = grid.ship_coordinates(coordinates)

    assert_equal expected_coordinates, actual_coordinates
  end

  def test_ship_coordinates_vertical_backward
    # skip
    grid = Grid.new(6)
    coordinates = [[3, 4], [3, 1]]

    expected_coordinates = [[3, 1], [3, 2], [3, 3], [3, 4]]
    actual_coordinates   = grid.ship_coordinates(coordinates)

    assert_equal expected_coordinates, actual_coordinates
  end

  def test_coordinates_empty
    # skip
    grid = Grid.new(6)
    coordinates_s1 = [[1, 3], [4, 3]]
    coordinates_s2 = [[3, 1], [3, 4]]

    coordinates_l1 = grid.ship_coordinates(coordinates_s1)
    coordinates_l2 = grid.ship_coordinates(coordinates_s2)

    assert_equal true, grid.coordinates_empty?(coordinates_l1)
    assert_equal true, grid.coordinates_empty?(coordinates_l2)
  end

  def test_coordinates_not_empty
    # skip
    grid = Grid.new(6)
    ship = Ship.new("Battleship", 4)
    grid.matrix[3][3] = ship
    coordinates_s1 = [[3, 1], [3, 4]]

    coordinates_l1 = grid.ship_coordinates(coordinates_s1)

    assert_equal false, grid.coordinates_empty?(coordinates_l1)
  end

  def test_add_ships
    # skip
    grid = Grid.new(12)
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
    grid = Grid.new(5)
    ship = Ship.new("Destroyer", 4)
    coordinates = grid.ship_coordinates([[3, 1], [3, 4]])
    grid_string =
      "==============" + "\n" +
      "   A B C D E"   + "\n" +
      " 1 . . . . ."   + "\n" +
      " 2 . . . . ."   + "\n" +
      " 3 . . . . ."   + "\n" +
      " 4 . D D D D"   + "\n" +
      " 5 . . . . ."   + "\n" +
      "=============="

    grid.place_ship(ship, coordinates)

    assert_equal grid.display_grid, grid_string

  end

  # The process of setting up the board for the computer:
  # 1) Create the main board
  # 2) Grab the first ship.
  # 3) Find the bow coordinates & position for the first ship.
  # 4) If the coordinates will have the ship go outside the grid
  #     or overlap with another ship, go back to step 3.
  # 5) If the bow coordinates are good, add the ship to the grid.
  # 6) Repeat steps 2 through 4 for the rest of ths ships.


end
