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

  def human_selects_coordinates
    UserInput.new.coordinate_selection(@size, 2)
  end

  def computer_selects_coordinates(coordinates)
    x, y = coordinates
    s = @size - 1
    bow_coordinates = [x, y]
    aft_coordinates = valid_aft_coordinates(x, y).sample
    return bow_coordinates, aft_coordinates
  end

  def valid_aft_coordinates(x, y)
    [x-s, x, x+s, x].zip([y, y-s, y, y+s])
  end

end