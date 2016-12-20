class Peg

  attr_reader :name,
              :abbv

  def initialize(name)
    @name = name
    @abbv = @name[0]
  end


end