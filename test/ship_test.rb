require 'simplecov'
SimpleCov.start

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

end