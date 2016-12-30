class Ship

  attr_reader   :abbv,
                :coordinates,
                :name,
                :size

  attr_accessor :coordinates

  def initialize(name, size, coordinates=nil)
    @abbv         = name[0]
    @coordinates  = coordinates
    @hits         = 0
    @name         = name
    @size         = size
    @sunk         = false
  end

end