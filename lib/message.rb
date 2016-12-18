require 'colorize'

class Message

  def welcome
    "Welcome to BATTLESHIP"
  end

  def welcome_instructions
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def starting_ship_placement(ships)
    instructions.push("AI player has laid out their ships on the grid.")
    instructions.push("You now need to layout your #{ships.length} ships.")
    ships.each do |ship|
      instructions.push("     #{ship.name} (#{ship.size} units)")
    end
    instructions.join("\n")
  end

  def player_ship_placement(ships, grid)
    instructions.push("Here is the grid layout:")
    instructions.push(grid.display_grid(true))
    instructions.push()
    instructions.push("Enter the squares for the #{ships.name}:")
    instructions.join("\n")
  end

  def game_instructions
    "PUT INSTRUCTIONS HERE\n.\n.\n."
  end

  def select_difficulty
    "Please select a difficulty: (b)eginner, (i)ntermediate, (a)dvanced"
  end

  def selection_error(selection)
    "Your selection of '#{selection}' was incorrect. Please make a correct selection.\n."
  end

  def game_quit
    ".\n.\n.\nThank you for playing!\n.\n."
  end

end