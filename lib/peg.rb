   class Peg

  attr_reader :name,
              :abbv

  def initialize(name=nil)
    @name = name
    @abbv = get_abbv
  end

  def get_abbv
    return "." if @name.nil?
    @name[0]
  end

end