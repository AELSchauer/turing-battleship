class Grid

  attr_reader :grid

  def initialize(size)
    @size = size
    @grid = create_grid(size)
  end

  def create_grid
    cols = get_hash("1")
    get_hash("A",cols)
  end

  def get_hash(character, value=nil)
    @size.times.reduce({}) do |h|
      h[character] = value
      character = character.next
      h
    end
  end

  def add_ship
    
  end

  def hit_or_miss
    
  end

  def check_grid

  end

  def display_grid(indent=false)

    p "=========="  #10
    p ". 1 2 3 4"   #4
    p "=========="

    p "===================="   #20
    p ". 1 2 3 4 5 6 7 8 9"    #9
    p "===================="

    p "======================="   #23
    p ". 1 2 3 4 5 6 7 8 9 10"    #10
    p "======================="

    p "=========================="   #26
    p ". 1 2 3 4 5 6 7 8 9 10 11"    #11
    p "=========================="
  end

  def header()

  end


end