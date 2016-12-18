class Ship

  def initialize(ship_name,size)
    @name         = ship_name
    @short_hand   = ship_name[0]
    @size         = size
    @current_hits = []
    @sunk         = false
  end



end