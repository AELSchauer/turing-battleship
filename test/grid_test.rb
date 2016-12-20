require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/grid'
require './lib/ship'

class GridTest < Minitest::Test

  def test_exists
    skip
    assert true
  end

  def test_grid_exists
    skip
    grid = Grid.new(4)

    assert_equal true, grid
    assert_equal 4,    grid.size
  end

  def test_get_hash_for_rows
    skip
    grid = Grid.new(4)
    hash_1 = {1=>".", 2=>".", 3=>".", 4=>"."}

    hash_t = grid.get_hash(1)

    assert_equal hash_1, hash_t
  end

  def test_get_hash_for_columns
    skip
    grid = Grid.new(4)
    hash_1 = {"A"=>".", "B"=>".", "C"=>".", "D"=>"."}

    hash_t = grid.get_hash("A")

    assert_equal hash_1, hash_t
  end

  def test_create_grid
    skip
    grid = Grid.new(4)
    grid_layout =
      { 1=>{"A"=>".", "B"=>".", "C"=>".", "D"=>"."},
        2=>{"A"=>".", "B"=>".", "C"=>".", "D"=>"."},
        3=>{"A"=>".", "B"=>".", "C"=>".", "D"=>"."},
        4=>{"A"=>".", "B"=>".", "C"=>".", "D"=>"."}
      }

    grid_test = grid.create_matrix

    assert_equal grid_layout, grid_test
  end

  def test_create_grid_automatically
    skip
    grid = Grid.new(4)
    grid_layout =
      { 1=>{"A"=>".", "B"=>".", "C"=>".", "D"=>"."},
        2=>{"A"=>".", "B"=>".", "C"=>".", "D"=>"."},
        3=>{"A"=>".", "B"=>".", "C"=>".", "D"=>"."},
        4=>{"A"=>".", "B"=>".", "C"=>".", "D"=>"."}
      }

    assert_equal grid_layout, grid.matrix
  end

  def test_outline_below_9
    skip
    grid = Grid.new(4)

    line = "=" * 12

    assert_equal line, grid.outline
  end

  def test_outline_above_9
    skip
    grid = Grid.new(10)

    line = "=" * 24

    assert_equal line, grid.outline
  end

  def test_column_labels_below_9
    skip
    grid = Grid.new(4)

    labels = "   A B C D"

    assert_equal labels, grid.column_labels
  end

  def test_column_labels_above_9
    skip
    grid = Grid.new(10)

    labels = "   A B C D E F G H I J"

    assert_equal labels, grid.column_labels
  end

  def test_grid_values_below_9
    skip
    grid = Grid.new(4)
    vals = " ." * 4

    assert_equal vals, grid.display_values(1)
  end

  def test_grid_values_above_9
    skip
    grid = Grid.new(11)
    vals = " ." * 11

    assert_equal vals, grid.display_values(1)
  end

  def test_grid_values_with_hits_and_misses   # update this test once hit or miss functionality has been added
    skip
    grid = Grid.new(6)
    grid.matrix[1]["B"] = "H"
    grid.matrix[1]["D"] = "M"
    vals = " . H . M . ."

    assert_equal vals, grid.display_values(1)
  end

  def test_row_labels_and_values_below_9
    skip
    grid = Grid.new(4)
    vals = []
    vals.push(" 1 . . . .")
    vals.push(" 2 . . . .")
    vals.push(" 3 . . . .")
    vals.push(" 4 . . . .")

    assert_equal vals, grid.row_labels_and_values
  end

  def test_display_matrix_small_indent
    skip
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

  def test_display_matrix_large_indent
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

  def test_coordinate_selection
    grid = Grid.new(12)

    row, col, pos = grid.coordinates_selection

    assert_equal true, (1..12).include?(row)
    assert_equal true, ("A".."L").include?(col)
    assert_equal true, ["h","v"].include?(pos)
  end

  def test_ship_placement_off_board_vertical
    grid = Grid.new(4)
    ship = Ship.new("Destroyer", 2)

    place = grid.check_ship_placement(ship, 4, "A", "v")

    assert_equal false, place
  end

  def test_ship_placement_not_off_board_vertical
    grid = Grid.new(4)
    ship = Ship.new("Destroyer", 2)

    place = grid.check_ship_placement(ship, 3, "A", "v")

    assert_equal true, place
  end

  def test_ship_placement_off_board_horizontal
    grid = Grid.new(4)
    ship = Ship.new("Destroyer", 2)

    place = grid.check_ship_placement(ship, 1, "D", "h")

    assert_equal false, place
  end

  def test_ship_placement_not_off_board_horizontal
    grid = Grid.new(4)
    ship = Ship.new("Destroyer", 2)

    place = grid.check_ship_placement(ship, 1, "C", "h")

    assert_equal true, place
  end

  def test_coordinates_valid
    grid = Grid.new(4)
    ship = Ship.new("Submarine", 3)
    coordinates = [[1, 3], [3, 3]]

    assert_equal true, grid.coordinates_valid?(coordinates)
  end

  def test_coordinates_not_valid
    grid = Grid.new(4)
    ship = Ship.new("Submarine", 3)
    coordinates = [[1, 3], [-1, 3]]

    assert_equal false, grid.coordinates_valid?(coordinates)
  end

  def test_ship_coordinates_horizontal_forward
    grid = Grid.new(4)
    coordinates = [[1, 3], [4, 3]]

    expected_coordinates  = [[1, 3], [2, 3], [3, 3], [4, 3]]
    actual_coordinates    = grid.ship_coordinates(coordinates)

    assert_equal expected_coordinates, actual_coordinates
  end

  def test_ship_coordinates_horizontal_backward
    grid = Grid.new(4)
    coordinates = [[4, 3], [1, 3]]

    expected_coordinates  = [[1, 3], [2, 3], [3, 3], [4, 3]]
    actual_coordinates    = grid.ship_coordinates(coordinates)

    assert_equal expected_coordinates, actual_coordinates
  end

  def test_ship_coordinates_vertical_forward
    grid = Grid.new(4)
    coordinates = [[3, 1], [3, 4]]

    expected_coordinates  = [[3, 1], [3, 2], [3, 3], [3, 4]]
    actual_coordinates    = grid.ship_coordinates(coordinates)

    assert_equal expected_coordinates, actual_coordinates
  end

  def test_ship_coordinates_vertical_backward
    grid = Grid.new(4)
    coordinates = [[3, 4], [3, 1]]

    expected_coordinates = [[3, 1], [3, 2], [3, 3], [3, 4]]
    actual_coordinates   = grid.ship_coordinates(coordinates)

    assert_equal expected_coordinates, actual_coordinates
  end

  def test_coordinates_empty
    grid = Grid.new(4)
    coordinates_s1 = [[1, 3], [4, 3]]
    coordinates_s2 = [[3, 1], [3, 4]]

    coordinates_l1 = grid.ship_coordinates(coordinates_s1)
    coordinates_l2 = grid.ship_coordinates(coordinates_s2)

    assert_equal true, grid.coordinates_empty?(coordinates_l1)
    assert_equal true, grid.coordinates_empty?(coordinates_l2)
  end

  def test_coordinates_not_empty
    grid = Grid.new(4)
    ship = Ship.new("Battleship", 4)
    grid.matrix[3][3] = ship
    coordinates_s1 = [[3, 1], [3, 4]]

    coordinates_l1 = grid.ship_coordinates(coordinates_s1)

    assert_equal false, grid.coordinates_empty?(coordinates_l1)
  end

  # def test_add_ships
  #   grid = Grid.new(12)
  #   ships = [ ["Destroyer",   2],
  #             ["Cruiser",     3],
  #             ["Battleship",  4],
  #             ["Carrier",     5]
  #           ]

  #   grid.add_ships(ships)

  #   assert_equal "Destroyer",   grid.ships[0].ship_name
  #   assert_equal "Cruiser",     grid.ships[1].ship_name
  #   assert_equal "Battleship",  grid.ships[2].ship_name
  #   assert_equal "Carrier",     grid.ships[3].ship_name
  # end

  # def test_place_ship
  #   grid = Grid.new(4)
  #   ship = Ship.new("Destroyer", 2)

  #   puts grid.place_ship(ship, 1, "A", "h")
  #   puts grid.place_ship(ship, 4, "D", "v")
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
