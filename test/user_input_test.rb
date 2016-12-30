# def test_input_coordinates
#     skip
#     grid = Grid.new(6, "Main Board")

#     input = grid.input_coordinates

#     assert input
#   end

#   def test_reg_ex
#     skip
#     grid = Grid.new(6, "Main Board")
#     input = "A1,A9"

#     valid = grid.reg_ex(input)

#     p valid

#   end

#   def test_valid_true
#     skip
#     grid = Grid.new(6, "Main Board")
#     input = "A"

#     valid = grid.valid?(input)

#     puts valid

#     assert valid

#   end

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

  # def test_valid_false
  #   # skip
  #   grid = Grid.new(6, "Main Board")
  #   input_1 = "A"
  #   input_2 = "A0"
  #   input_3 = "A1?"
  #   input_4 = "A1,A2"
  #   input_5 = "A1;A2"
  #   input_6 = "A7"

  #   valid_1 = grid.input_coordinates(input_1)
  #   valid_2 = grid.input_coordinates(input_2)
  #   valid_3 = grid.input_coordinates(input_3)
  #   valid_4 = grid.input_coordinates(input_4)
  #   valid_5 = grid.input_coordinates(input_5)
  #   valid_6 = grid.input_coordinates(input_6)

  #   refute valid_1
  #   refute valid_2
  #   refute valid_3
  #   refute valid_4
  #   refute valid_5
  #   refute valid_6
  # end

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