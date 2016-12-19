require './lib/grid'
require './lib/message'

class Game

  attr_reader :player_main,
              :player_tracker,
              :computer_main,
              :computer_tracker

  def initialize
    @message = Message.new
  end

  def welcome
    puts @message.welcome
    welcome_instructions
  end

  def welcome_instructions
    puts @message.welcome_instructions
    selection = get_selection
    case selection
    when "i"
      game_instructions
    when "p"
      select_difficulty
    when "q"
      game_exit
    else
      puts @message.selection_error(selection)
      welcome_instructions
    end
  end

  def select_difficulty
    puts @message.select_difficulty
    selection = get_selection
    case selection
    when "b"
      size = 4
      ships = [ ["Destroyer",   2],
                ["Cruiser",     3]
              ]
      game_setup(size, ships)
    when "i"
      size = 8
      ships = [ ["Destroyer",   2],
                ["Cruiser",     3],
                ["Battleship",  4]
              ]
      game_setup(size, ships)
    when "a"
      size = 8
      ships = [ ["Destroyer",   2],
                ["Cruiser",     3],
                ["Battleship",  4],
                ["Carrier",     5]
              ]
      game_setup(size, ships)
    else
      puts @message.selection_error(selection)
      select_difficulty
    end
  end

  def game_setup(size, ships)
    computer_setup(size, ships)
    player_setup(size, ships)
  end

  def start_play
    # computer sets board
    # player sets board
  end

  def player_setup(size, ships)
    @player_main = Grid.new(size,"Player")
    @player_main.get_ships(ships)
    @player_tracker = Grid.new(size,"Player Tracker")
  end

  def computer_setup(size, ships)
    @computer_main = Grid.new(size,"Computer")
    @computer_main.get_ships(ships)
    @computer_main.ships.each do |ship|
      while true
        break unless @computer_main.place_ship
      end
    end
    @computer_main.display_grid
    @computer_tracker = Grid.new(size,"Computer Tracker")
  end

  def get_selection
    gets.downcase.gsub("\n","")
  end

  def game_instructions
    puts @message.game_instructions
    welcome_instructions
  end

  def play_again?
    #if you want to play again, output to true
    #if don't want to play again, go to game exit (output = false)
    game_exit
  end

  def game_exit
    puts @message.game_quit
    false
  end

end