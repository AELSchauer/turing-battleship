require 'simplecov'
SimpleCov.start

require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/grid'
require './lib/ship'
require './lib/peg'

class GridTest < Minitest::Test

  # def test_exists
  #   assert true
  # end

  # def test_grid_exists
  #   grid = Grid.new(4, "Main Board")

  #   assert                  grid
  #   assert_equal 4,         grid.size
  # end

  # def test_create_matrix
  #   grid = Grid.new(4, "Main Board")

  #   grid_test = grid.create_matrix

  #   assert_equal 4,   grid_test.length
  #   assert_equal 4,   grid_test[0].length
  #   assert_equal Peg, grid_test[rand(0..3)][rand(0..3)].class
  # end

  # def test_create_matrix_automatically
  #   grid = Grid.new(4, "Main Board")

  #   assert_equal 4,   grid.matrix.length
  #   assert_equal 4,   grid.matrix[0].length
  #   assert_equal Peg, grid.matrix[rand(0..3)][rand(0..3)].class
  # end

  # def test_outline_below_9
  #   grid = Grid.new(4, "Main Board")

  #   line = "=" * 12

  #   assert_equal line, grid.outline
  # end

  # def test_outline_above_9
  #   grid = Grid.new(12, "Main Board")

  #   line = "=" * 28

  #   assert_equal line, grid.outline
  # end

  # def test_column_labels_below_9
  #   grid = Grid.new(4, "Main Board")

  #   labels = "   A B C D"

  #   assert_equal labels, grid.column_labels
  # end

  # def test_column_labels_above_9
  #   grid = Grid.new(12, "Main Board")

  #   labels = "   A B C D E F G H I J K L"

  #   assert_equal labels, grid.column_labels
  # end

  # def test_grid_values_below_9
  #   grid = Grid.new(4, "Main Board")
  #   vals = " ." * 4

  #   assert_equal vals, grid.display_values(1)
  # end

  # def test_grid_values_above_9
  #   grid = Grid.new(12, "Main Board")
  #   vals = " ." * 12

  #   assert_equal vals, grid.display_values(1)
  # end

  # def test_display_grid_values_empty   # update this test once hit or miss functionality has been added
  #   grid = Grid.new(6, "Main Board")
  #   vals = " . . . . . ."

  #   assert_equal vals, grid.display_values(1)
  # end

  # def test_display_grid_values_with_hits_and_misses   # update this test once hit or miss functionality has been added
  #   grid = Grid.new(6, "Main Board")
  #   grid.matrix[1][2] = Peg.new("Hit")
  #   grid.matrix[1][4] = Peg.new("Miss")
  #   vals = " . . H . M ."

  #   assert_equal vals, grid.display_values(1)
  # end

  # def test_row_labels_and_values_below_9
  #   grid = Grid.new(4, "Main Board")
  #   vals = []
  #   vals.push(" 1 . . . .")
  #   vals.push(" 2 . . . .")
  #   vals.push(" 3 . . . .")
  #   vals.push(" 4 . . . .")

  #   assert_equal vals, grid.row_labels_and_values
  # end

  # def test_display_matrix_small
  #   grid = Grid.new(4, "Main Board")
  #   grid_string =
  #     "============" + "\n" +
  #     "   A B C D"   + "\n" +
  #     " 1 . . . ."   + "\n" +
  #     " 2 . . . ."   + "\n" +
  #     " 3 . . . ."   + "\n" +
  #     " 4 . . . ."   + "\n" +
  #     "============"

  #   assert_equal grid_string, grid.display_grid
  # end

  # def test_display_matrix_large
  #   grid = Grid.new(12, "Main Board")
  #   grid_string =
  #     "============================" + "\n" +
  #     "   A B C D E F G H I J K L"   + "\n" +
  #     " 1 . . . . . . . . . . . ."   + "\n" +
  #     " 2 . . . . . . . . . . . ."   + "\n" +
  #     " 3 . . . . . . . . . . . ."   + "\n" +
  #     " 4 . . . . . . . . . . . ."   + "\n" +
  #     " 5 . . . . . . . . . . . ."   + "\n" +
  #     " 6 . . . . . . . . . . . ."   + "\n" +
  #     " 7 . . . . . . . . . . . ."   + "\n" +
  #     " 8 . . . . . . . . . . . ."   + "\n" +
  #     " 9 . . . . . . . . . . . ."   + "\n" +
  #     "10 . . . . . . . . . . . ."   + "\n" +
  #     "11 . . . . . . . . . . . ."   + "\n" +
  #     "12 . . . . . . . . . . . ."   + "\n" +
  #     "============================"

  #   assert_equal grid_string, grid.display_grid
  # end

  # def test_coordinates_empty
  #   grid = Grid.new(6, "Main Board")
  #   coordinates_s1 = [[1, 3], [4, 3]]
  #   coordinates_s2 = [[3, 1], [3, 4]]

  #   coordinates_l1 = CoordinatesGenerator.new(6, coordinates_s1).add_mid_ship_coordinates
  #   coordinates_l2 = CoordinatesGenerator.new(6, coordinates_s2).add_mid_ship_coordinates

  #   assert_equal true, grid.coordinates_empty?(coordinates_l1)
  #   assert_equal true, grid.coordinates_empty?(coordinates_l2)
  # end

  # def test_coordinates_not_empty
  #   grid = Grid.new(6, "Main Board")
  #   ship = Ship.new("Battleship", 4)
  #   grid.matrix[3][3] = ship
  #   coordinates_s1 = [[3, 1], [3, 4]]

  #   coordinates_l1 = CoordinatesGenerator.new(6, coordinates_s1).add_mid_ship_coordinates

  #   assert_equal false, grid.coordinates_empty?(coordinates_l1)
  # end

  # def test_add_ships
  #   grid = Grid.new(12, "Main Board")
  #   ships = [ ["Destroyer",  2],
  #             ["Cruiser",    3],
  #             ["Battleship", 4],
  #             ["Carrier",    5]
  #           ]

  #   grid.grab_ships(ships)

  #   assert_equal "Destroyer",   grid.ships[0].name
  #   assert_equal "Cruiser",     grid.ships[1].name
  #   assert_equal "Battleship",  grid.ships[2].name
  #   assert_equal "Carrier",     grid.ships[3].name
  # end

  # def test_place_object_one_hit_peg
  #   grid_string =
  #     "================" + "\n" +
  #     "   A B C D E F"   + "\n" +
  #     " 1 . . . . . ."   + "\n" +
  #     " 2 . . . . . ."   + "\n" +
  #     " 3 . H . . . ."   + "\n" +
  #     " 4 . . . . . ."   + "\n" +
  #     " 5 . . . . . ."   + "\n" +
  #     " 6 . . . . . ."   + "\n" +
  #     "================"

  #   grid = Grid.new(6, "Main Board")
  #   peg = Peg.new("Hit")
  #   generator = CoordinatesGenerator.new(6, [[2, 1]])
  #   generator.add_mid_ship_coordinates

  #   grid.place_object(peg, generator.coordinates)

  #   assert_equal grid.display_grid, grid_string
  # end

  # def test_place_object_one_miss
  #   grid_string =
  #     "================" + "\n" +
  #     "   A B C D E F"   + "\n" +
  #     " 1 . . . . . ."   + "\n" +
  #     " 2 . . . . . ."   + "\n" +
  #     " 3 . . . . . ."   + "\n" +
  #     " 4 . . . . . ."   + "\n" +
  #     " 5 . . . . . ."   + "\n" +
  #     " 6 . . M . . ."   + "\n" +
  #     "================"

  #   grid = Grid.new(6, "Main Board")
  #   peg = Peg.new("Miss")
  #   generator = CoordinatesGenerator.new(6, [[5, 2]])
  #   generator.add_mid_ship_coordinates

  #   grid.place_object(peg, generator.coordinates)

  #   assert_equal grid.display_grid, grid_string
  # end

  # def test_place_object_one_hit_miss
  #   grid_string =
  #     "================" + "\n" +
  #     "   A B C D E F"   + "\n" +
  #     " 1 . . . . . ."   + "\n" +
  #     " 2 . . . . . ."   + "\n" +
  #     " 3 . H . . . ."   + "\n" +
  #     " 4 . . . . . ."   + "\n" +
  #     " 5 . . . . . ."   + "\n" +
  #     " 6 . . M . . ."   + "\n" +
  #     "================"

  #   grid = Grid.new(6, "Main Board")
  #   peg_1 = Peg.new("Miss")
  #   peg_2 = Peg.new("Hit")
  #   generator_1 = CoordinatesGenerator.new(6, [[5, 2]])
  #   generator_2 = CoordinatesGenerator.new(6, [[2, 1]])
  #   generator_1.add_mid_ship_coordinates
  #   generator_2.add_mid_ship_coordinates

  #   grid.place_object(peg_1, generator_1.coordinates)
  #   grid.place_object(peg_2, generator_2.coordinates)

  #   assert_equal grid.display_grid, grid_string
  # end

  # def test_place_object_one_ship
  #   grid_string =
  #     "================" + "\n" +
  #     "   A B C D E F"   + "\n" +
  #     " 1 . . . . . ."   + "\n" +
  #     " 2 . . . . . ."   + "\n" +
  #     " 3 . . . . . ."   + "\n" +
  #     " 4 . D D D D ."   + "\n" +
  #     " 5 . . . . . ."   + "\n" +
  #     " 6 . . . . . ."   + "\n" +
  #     "================"

  #   grid = Grid.new(6, "Main Board")
  #   ship = Ship.new("Destroyer", 4)
  #   generator = CoordinatesGenerator.new(6, [[3, 1], [3, 4]])
  #   generator.add_mid_ship_coordinates

  #   grid.place_object(ship, generator.coordinates)

  #   assert_equal grid.display_grid, grid_string
  # end

  # def test_place_object_two_ships
  #   grid_string =
  #     "================" + "\n" +
  #     "   A B C D E F"   + "\n" +
  #     " 1 . . . C . ."   + "\n" +
  #     " 2 . . . C . ."   + "\n" +
  #     " 3 . . . C . ."   + "\n" +
  #     " 4 . . . C . ."   + "\n" +
  #     " 5 . . . C . ."   + "\n" +
  #     " 6 . D D D D ."   + "\n" +
  #     "================"

  #   grid = Grid.new(6, "Main Board")
  #   ship_1 = Ship.new("Destroyer", 4)
  #   ship_2 = Ship.new("Carrier", 5)
  #   generator_1 = CoordinatesGenerator.new(6, [[5, 1], [5, 4]])
  #   generator_2 = CoordinatesGenerator.new(6, [[0, 3], [4, 3]])
  #   generator_1.add_mid_ship_coordinates
  #   generator_2.add_mid_ship_coordinates

  #   grid.place_object(ship_1, generator_1.coordinates)
  #   grid.place_object(ship_2, generator_2.coordinates)

  #   assert_equal grid.display_grid, grid_string
  # end

  # def test_place_multiples_ships
  #   grid = Grid.new(6, "Main Board")
  #   ships = [ ["Destroyer",  2],
  #             ["Cruiser",    3],
  #             ["Battleship", 4],
  #             ["Carrier",    5]
  #           ]

  #   grid.grab_ships(ships)
  #   coordinates = CoordinatesGenerator.new(6, [[3, 1], [3, 4]]).add_mid_ship_coordinates
  #   grid_string =
  #     "================" + "\n" +
  #     "   A B C D E F"   + "\n" +
  #     " 1 . . . . . ."   + "\n" +
  #     " 2 . . . . . ."   + "\n" +
  #     " 3 . . . . . ."   + "\n" +
  #     " 4 . D D D D ."   + "\n" +
  #     " 5 . . . . . ."   + "\n" +
  #     " 6 . . . . . ."   + "\n" +
  #     "================"

  #   grid.place_object(ship, coordinates)

  #   assert_equal grid.display_grid, grid_string
  # end

  def test_place_ships_on_board_vertical
    grid_string =
      "================" + "\n" +
      "   A B C D E F"   + "\n" +
      " 1 C B S D . ."   + "\n" +
      " 2 C B S D . ."   + "\n" +
      " 3 C B S . . ."   + "\n" +
      " 4 C B . . . ."   + "\n" +
      " 5 C . . . . ."   + "\n" +
      " 6 . . . . . ."   + "\n" +
      "================"
    grid = Grid.new(6, "Main Board", true)

    ships = [ ["Destroyer",  2, "D1 D2"],
              ["Submarine",  3, "C1 C3"],
              ["Battleship", 4, "B1 B4"],
              ["Carrier",    5, "A1 A5"]
            ]

    grid.grab_ships(ships)
    grid.place_ships_on_board

    assert_equal grid_string, grid.display_grid
  end

  def test_place_ships_on_board_horizontal
    grid_string =
      "================" + "\n" +
      "   A B C D E F"   + "\n" +
      " 1 C C C C C ."   + "\n" +
      " 2 B B B B . ."   + "\n" +
      " 3 S S S . . ."   + "\n" +
      " 4 D D . . . ."   + "\n" +
      " 5 . . . . . ."   + "\n" +
      " 6 . . . . . ."   + "\n" +
      "================"
    grid = Grid.new(6, "Main Board", true)

    ships = [ ["Destroyer",  2, "A4 B4"],
              ["Submarine",  3, "A3 C3"],
              ["Battleship", 4, "A2 D2"],
              ["Carrier",    5, "A1 E1"]
            ]

    grid.grab_ships(ships)
    grid.place_ships_on_board

    assert_equal grid_string, grid.display_grid
  end

  def test_place_ships_on_board_with_human_input
    skip
    grid_string =
      "================" + "\n" +
      "   A B C D E F"   + "\n" +
      " 1 . . S D . ."   + "\n" +
      " 2 . . S D . ."   + "\n" +
      " 3 . . S . . ."   + "\n" +
      " 4 . . . . . ."   + "\n" +
      " 5 . . . . . ."   + "\n" +
      " 6 . . . . . ."   + "\n" +
      "================"
    grid = Grid.new(6, "Main Board", false)

    puts "Enter 'D1 D2' for the Destroyer. Enter 'C1 C3' for the Submarine."

    ships = [ ["Destroyer", 2],
              ["Submarine", 3]
            ]

    grid.grab_ships(ships)
    grid.place_ships_on_board

    assert_equal grid_string, grid.display_grid
  end

  def test_place_ships_on_board_overlap
    grid_string =
      "================" + "\n" +
      "   A B C D E F"   + "\n" +
      " 1 D . . . . ."   + "\n" +
      " 2 D S . . . ."   + "\n" +
      " 3 . S . . . ."   + "\n" +
      " 4 . S . . . ."   + "\n" +
      " 5 . . . . . ."   + "\n" +
      " 6 . . . . . ."   + "\n" +
      "================"
    grid = Grid.new(6, "Main Board", false)

    # generator_1 = CoordinatesGenerator.new(6, "A1 A2")
    # generator_2 = CoordinatesGenerator.new(6, "B1 D1")

    puts "Enter 'B2 B4' for the Submarine."

    # generator_1.human_declare_ship_coordinates(2)
    # generator_2.human_declare_ship_coordinates(3)

    # coordinates_1 = generator_1.coordinates
    # coordinates_2 = generator_2.coordinates

    ships = [ ["Destroyer",  2, "A1 A2"],
              ["Submarine",  3, "A2 A4"]
            ]

    grid.grab_ships(ships)
    grid.place_ships_on_board

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
