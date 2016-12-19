class Message

  def welcome
    # trailing(3)
    puts "Welcome to BATTLESHIP"
    # trailing(2)
  end

  def welcome_instructions
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def starting_ship_placement(ships)
    "AI player has laid out their ships on the grid." +
    "You now need to layout your #{ships.length} ships." +
    ships.map { |ship| "#{indent}#{ship.name} (#{ship.size} units)" }.join
    # ships.map do |ship|
    #   indent + "#{ship.name} (#{ship.size} units)"
    # end
  end

  def player_ship_placement(ship, grid)
    puts "Here is your grid layout:"
    puts grid.display_grid(true)
    puts ""
    puts "Enter the coordinates for the bow of the #{ship.name} (#{ship.size} units) and (h)orizontal or (v)ertical:"
  end

  def game_instructions
    puts "PUT INSTRUCTIONS HERE."
    # trailing(3)
  end

  def select_difficulty
    puts "Please select a difficulty: (b)eginner, (i)ntermediate, (a)dvanced"
  end

  def selection_error(selection)
    puts "Your selection of '#{selection}' was incorrect. Please make a correct selection."
    puts "."
  end

  def game_quit
    puts "\n\n\nThank you for playing!\n\n"
  end

  def trailing(n)
    n.times { puts "" }
  end

end