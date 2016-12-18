require './lib/grid'
require './lib/message'

class Game

  attr_reader :player,
              :computer

  def initialize
    @message = Message.new
  end

  def welcome
    p @message.welcome
    welcome_instructions
  end

  def welcome_instructions
    p @message.welcome_instructions
    selection = get_selection
    if selection == "i"
      game_instructions
    elsif selection == "p"
      select_difficulty
    elsif selection == "q"
      game_exit
    else
      p @message.selection_error(selection)
      welcome_instructions
    end
  end

  def select_difficulty
    p @message.select_difficulty
    selection = get_selection
    if ["b","i","a"].include?(selection)
      if selection == "b"
        size = 4
        ships = [ Ships.new("Destroyer", 2),
                  Ships.new("Cruiser",   3) ]
      end
      if selection == "i"
        size = 8
        ships = [ Ships.new("Destroyer",  2),
                  Ships.new("Cruiser",    3),
                  Ships.new("Battleship", 4) ]
      elsif selection == "a"
        size = 12
        ships = [ Ships.new("Destroyer",  2),
                  Ships.new("Cruiser",    3),
                  Ships.new("Battleship", 4),
                  Ships.new("Carrier",    5) ]
      end
      @player = Grid.new(size)
      @computer = Grid.new(size)
      start_game
    else
      p @message.selection_error(selection)
      select_difficulty
    end
  end

  def start_game
  end

  def get_selection
    gets.downcase.gsub("\n","")
  end

  def game_instructions
    @message.game_instructions
    welcome_instructions
  end

  def play_again?
    #if you want to play again, output to true
    #if don't want to play again, go to game exit (output = false)
    game_exit
  end

  def game_exit
    p @message.game_quit
    false
  end

end