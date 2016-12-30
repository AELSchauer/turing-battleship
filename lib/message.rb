class Message

  def self.welcome
    # trailing(3)
    puts "Welcome to BATTLESHIP"
    # trailing(2)
  end

  def self.welcome_instructions
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def self.starting_ship_placement(ships)
    "AI player has laid out their ships on the grid." +
    "You now need to layout your #{ships.length} ships." +
    ships.map { |ship| "#{indent}#{ship.name} (#{ship.size} units)" }.join
    # ships.map do |ship|
    #   indent + "#{ship.name} (#{ship.size} units)"
    # end
  end

  def self.player_ship_placement(ship, grid_object)
    puts "Here is your grid layout:"
    puts grid_object.display_grid
    puts ""
    puts "Enter the coordinates for the bow and stern of the #{ship.name} (#{ship.size} units):"
  end

  def self.game_instructions
    puts "PUT INSTRUCTIONS HERE."
    # trailing(3)
  end

  def self.select_difficulty
    puts "Please select a difficulty: (b)eginner, (i)ntermediate, (a)dvanced"
  end

  def self.selection_error(selection)
    puts "Your selection of '#{selection}' was incorrect. Please make a correct selection."
    puts "."
  end

  def self.game_quit
    puts "\n\n\nThank you for playing!\n\n"
  end

  def self.trailing(n)
    n.times { puts "" }
  end

  def self.get_human_name
    puts "What's your name?"
  end

  def self.coordinates_not_empty
    puts "The coordinates you entered overlap with at least one other object."
  end

end