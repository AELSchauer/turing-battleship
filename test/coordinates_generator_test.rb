require 'simplecov'
SimpleCov.start

require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/coordinates_generator'

class CoordinatesGeneratorTest < Minitest::Test

  def test_exists
    assert true
  end

  def test_computer_declare_firing_coordinates
    generator = CoordinatesGenerator.new(4)
    coordinates = generator.computer_declare_firing_coordinates

    assert coordinates
    assert coordinates[0] < 4
    assert coordinates[1] < 4
    assert coordinates[0] > -1
    assert coordinates[1] > -1
  end

  def test_coordinates_valid
    coordinates = [[0, 3], [3, 3]]
    generator_1 = CoordinatesGenerator.new(4, coordinates)
    generator_2 = CoordinatesGenerator.new(3, coordinates)

    assert generator_1.coordinates_valid?
    refute generator_2.coordinates_valid?
  end

  def test_coordinates_not_valid
    coordinates = [[1, 3], [-1, 3]]
    generator = CoordinatesGenerator.new(4, coordinates)

    refute generator.coordinates_valid?
  end

  def test_ship_coordinates_horizontal_forward
    coordinates = [[1, 3], [4, 3]]
    generator = CoordinatesGenerator.new(5, coordinates)
    expected_coordinates = [[1, 3], [2, 3], [3, 3], [4, 3]]

    actual_coordinates = generator.add_mid_ship_coordinates

    assert_equal expected_coordinates, actual_coordinates
    assert_equal expected_coordinates, generator.coordinates
  end

  def test_ship_coordinates_horizontal_backward
    coordinates = [[4, 3], [1, 3]]
    generator = CoordinatesGenerator.new(5, coordinates)
    expected_coordinates = [[1, 3], [2, 3], [3, 3], [4, 3]]

    actual_coordinates = generator.add_mid_ship_coordinates

    assert_equal expected_coordinates, actual_coordinates
    assert_equal expected_coordinates, generator.coordinates
  end

  def test_ship_coordinates_vertical_forward
    coordinates = [[3, 1], [3, 4]]
    generator = CoordinatesGenerator.new(4, coordinates)
    expected_coordinates = [[3, 1], [3, 2], [3, 3], [3, 4]]

    actual_coordinates = generator.add_mid_ship_coordinates

    assert_equal expected_coordinates, actual_coordinates
    assert_equal expected_coordinates, generator.coordinates
  end

  def test_ship_coordinates_vertical_backward
    coordinates = [[3, 1], [3, 4]]
    generator = CoordinatesGenerator.new(4, coordinates)
    expected_coordinates = [[3, 1], [3, 2], [3, 3], [3, 4]]

    actual_coordinates = generator.add_mid_ship_coordinates

    assert_equal expected_coordinates, actual_coordinates
    assert_equal expected_coordinates, generator.coordinates
  end

  def test_computer_declare_ship_coordinates
    coordinates = "A1 A2"
    generator = CoordinatesGenerator.new(4, coordinates)
    deltas = []

    generator.computer_declare_ship_coordinates(2)
    bow_coordinates, aft_coordinates = generator.coordinates

    bow_x = bow_coordinates[0]
    bow_y = bow_coordinates[1]
    aft_x = aft_coordinates[0]
    aft_y = aft_coordinates[1]

    deltas.push((bow_x - aft_x).abs)
    deltas.push((bow_y - aft_y).abs)
    deltas.sort!

    assert_equal true, bow_x < 4 && bow_x > -1
    assert_equal true, bow_y < 4 && bow_y > -1
    assert_equal 0, deltas[0]
    assert_equal 1, deltas[1]
  end

  def test_human_declare_firing_coordinates_input
    skip
    generator = CoordinatesGenerator.new(12)

    puts "Testing input: enter 'A1'"
    generator.human_declare_firing_coordinates

    assert_equal [[0,0]], generator.coordinates
  end

  def test_human_declare_ship_coordinates_input
    skip
    generator = CoordinatesGenerator.new(12)

    puts "Testing input: enter 'A1 A2'"
    generator.human_declare_ship_coordinates(2)

    assert_equal [[0,0],[1,0]], generator.coordinates
  end

  def test_human_declare_firing_coordinates
    generator_1 = CoordinatesGenerator.new(4, "A6")
    generator_2 = CoordinatesGenerator.new(12, "A6")

    generator_1.human_declare_firing_coordinates
    generator_2.human_declare_firing_coordinates

    refute                generator_1.coordinates
    assert_equal [[5,0]], generator_2.coordinates
  end

  def test_human_declare_ship_coordinates
    generator_1 = CoordinatesGenerator.new(4, "A1 A2")
    generator_2 = CoordinatesGenerator.new(4, "A4 A5")
    generator_3 = CoordinatesGenerator.new(12, "A9 A10")
    generator_4 = CoordinatesGenerator.new(9,  "A9 A10")

    generator_1.human_declare_ship_coordinates(2)
    generator_2.human_declare_ship_coordinates(2)
    generator_3.human_declare_ship_coordinates(2)
    generator_4.human_declare_ship_coordinates(2)

    assert_equal [[0,0],[1,0]], generator_1.coordinates
    refute                      generator_2.coordinates
    assert_equal [[8,0],[9,0]], generator_3.coordinates
    refute                      generator_4.coordinates
  end

  def test_human_declare_firing_coordinates_invalid
    generator = CoordinatesGenerator.new(4, "7M")

    generator.human_declare_firing_coordinates

    refute generator.coordinates
  end

  def test_human_declare_ship_coordinates_invalid
    generator = CoordinatesGenerator.new(4, "A1;A2")

    generator.human_declare_ship_coordinates(2)

    refute generator.coordinates
  end

end