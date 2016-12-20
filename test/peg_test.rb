require 'simplecov'
SimpleCov.start

require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/peg'

class GridTest < Minitest::Test

  def test_exists
    # skip
    assert true
  end

  def test_peg_exists
    peg = Peg.new

    assert peg
  end

  def test_peg_hit
    peg = Peg.new("Hit")

    assert_equal "Hit", peg.name
    assert_equal "H",   peg.abbv
  end

  def test_peg_miss
    peg = Peg.new("Miss")

    assert_equal "Miss", peg.name
    assert_equal "M",    peg.abbv
  end

  def test_peg_empty
    peg = Peg.new

    assert_equal nil, peg.name
    assert_equal ".", peg.abbv
  end

end