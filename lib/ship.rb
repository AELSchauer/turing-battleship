class Ship

  attr_reader :name,
              :abbv,
              :size

  def initialize(name, size)
    @name = name
    @abbv = name[0]
    @size = size
    @hits = 0
    @sunk = false
  end

  def computer_selects_coordinates(grid_size)
    x = (1..grid_size).to_a.sample
    y = (1..grid_size).to_a.sample
    s = @size - 1
    bow_coordinates = [x, y]
    aft_coordinates = valid_aft_coordinates(x, y).sample
    return bow_coordinates, aft_coordinates
  end

  def human_selects_coordinates
    # letters = x-axis / columns
    # numbers = y-axis / rows

    # error if user inputs number first
    # error if user only inputs one argument
    # error if user does not use a space as their delimiter
    # use the matrix zip from above to come up with a list of valid aft coordinates
    #   if it doesn't match up, give an error

  end

  def valid_aft_coordinates(x, y)
    [x-s, x, x+s, x].zip([y, y-s, y, y+s])
  end

end