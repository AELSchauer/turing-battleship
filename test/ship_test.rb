require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test

  def test_exists
    assert true
  end

  def test_ship_exists
    ship = Ship.new("Submarine", 3)

    assert                    ship
    assert_equal Ship,        ship.class
    assert_equal 3,           ship.size
    assert_equal "Submarine", ship.name
  end

  def test_computer_select_coordinates
    ship = Ship.new("Submarine", 3)
    deltas = []

    bow_coordinates, aft_coordinates = ship.computer_select_coordinates(5)

    bow_x = bow_coordinates[0]
    bow_y = bow_coordinates[1]
    aft_x = aft_coordinates[0]
    aft_y = aft_coordinates[1]

    deltas.push((bow_x - aft_x).abs)
    deltas.push((bow_y - aft_y).abs)
    deltas.sort!

    assert_equal true, bow_x < 6 && bow_x > 0
    assert_equal true, bow_y < 6 && bow_y > 0
    assert_equal 0, deltas[0]
    assert_equal 2, deltas[1]
  end

end