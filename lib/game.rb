require './lib/player'
require './lib/message'
require 'pry'

class Game

  attr_reader :human,
              :computer

  def initialize
    @message = Message.new
  end

  def get_selection
    gets.upcase.gsub("\n","")
  end

  #### Game Start

  def game_start_welcome
    puts @message.welcome
    game_start_menu
  end

  def game_start_menu
    puts @message.welcome_instructions
    selection = get_selection
    case selection
    when "I"
      game_instructions
    when "P"
      select_difficulty
    when "Q"
      game_exit
    else
      puts @message.selection_error(selection)
      welcome_instructions
    end
  end

  #### Game Instructions

  def game_instructions
    puts @message.game_instructions
    game_start_menu
  end


  #### Game Setup

  def game_setup
    size, ships = select_difficulty
    computer_setup(size, ships)
    human_setup(size, ships)
    start_game
  end

  def select_difficulty
    puts @message.select_difficulty
    selection = get_selection
    case selection
    when "B"
      size = 4
      ships = [ ["Destroyer",   2],
                ["Cruiser",     3]
              ]
        human_setup(size, ships)
        computer_setup(size, ships)
        return size, ships
    when "I"
      size = 8
      ships = [ ["Destroyer",   2],
                ["Cruiser",     3],
                ["Battleship",  4]
              ]
        human_setup(size, ships)
        computer_setup(size, ships)
        return size, ships
    when "A"
      size = 8
      ships = [ ["Destroyer",   2],
                ["Cruiser",     3],
                ["Battleship",  4],
                ["Carrier",     5]
              ]
        human_setup(size, ships)
        computer_setup(size, ships)
        return size, ships
    else
      puts @message.selection_error(selection)
      select_difficulty
    end
  end

  def human_setup(size, ships)
    @message.get_human_name
    user_name = get_selection
    @human = Player.new(user_name, false)    #creates player
    @human.board_setup(size, ships)          #creates board
  end

  def computer_setup(size, ships)
    @computer = Player.new("Computer", true)    #creates player
    @computer.board_setup(size, ships)          #creates board
  end


  ##### Play Game

  # def start_game
  #   # start game timer
  #   # game_sequence
  # end

  # def game_sequence
  #   # computer takes their turn
  #   # human takes their turn
  #   # for each player, count number of turns
  #   # after each turn, check if the game is won
  # end


  #### End the Game

  # def end_game
  #   # send sorry or congratulations message depending on who won
  #   # output the total time it took to play the game
  #   # output the number of turns it took the winner to win
  # end

  # def play_again?
  #   #if you want to play again, output to true
  #   #if don't want to play again, go to game exit (output = false)
  #   game_exit
  # end


  #### Quit Game

  def game_exit
    puts @message.game_quit
    false
  end


end