class Ship

  attr_reader :ship_name,
              :abbv,
              :size

  def initialize(ship_name, size)
    @ship_name    = ship_name
    @abbv         = ship_name[0]
    @size         = size
    @current_hits = []
    @sunk         = false
  end



end