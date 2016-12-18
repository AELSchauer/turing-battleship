require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/grid'

class GridTest < Minitest::Test

  def test_exists
    assert true
  end

  def test_grid_exists
    grid = Grid.new(4)

    assert grid
  end

  def test_grid_get_hash_for_columns
    grid = Grid.new(4)
    hash_1 = {"1"=>nil, "2"=>nil, "3"=>nil, "4"=>nil}

    hash_t = grid.get_hash(4, "1")

    assert_equal hash_1, hash_t
  end

  def test_grid_get_hash_for_rows
    grid = Grid.new(4)
    hash_1 = {"A"=>nil, "B"=>nil, "C"=>nil, "D"=>nil}

    hash_t = grid.get_hash(4, "A")

    assert_equal hash_1, hash_t
  end

  def test_create_grid
    grid = Grid.new(4)
    grid_layout =
      { "A"=>{"1"=>nil, "2"=>nil, "3"=>nil, "4"=>nil},
        "B"=>{"1"=>nil, "2"=>nil, "3"=>nil, "4"=>nil},
        "C"=>{"1"=>nil, "2"=>nil, "3"=>nil, "4"=>nil},
        "D"=>{"1"=>nil, "2"=>nil, "3"=>nil, "4"=>nil}
      }

    grid_test = grid.create_grid(4)

    assert_equal grid_layout, grid_test
  end

  def test_create_grid_automatically
    grid = Grid.new(4)
    grid_layout =
      { "A"=>{"1"=>nil, "2"=>nil, "3"=>nil, "4"=>nil},
        "B"=>{"1"=>nil, "2"=>nil, "3"=>nil, "4"=>nil},
        "C"=>{"1"=>nil, "2"=>nil, "3"=>nil, "4"=>nil},
        "D"=>{"1"=>nil, "2"=>nil, "3"=>nil, "4"=>nil}
      }

    assert_equal grid_layout, grid.grid
  end

  def test_display_grid
    grid = Grid.new(4)
    grid.display_grid

    

  end


end