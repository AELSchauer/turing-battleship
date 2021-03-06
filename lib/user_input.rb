require 'pry'
require './lib/message'

class UserInput

  def initialize(input=nil)
    @input = input.nil? ? get_input : input
  end

  # def start_menu

  # end

  # def start_menu_valid?

  # end

  # def difficulty_selection

  # end

  # def difficulty_selection_valid?

  # end

  def get_input
    gets.upcase.gsub!("\n","")
  end

  def coordinate_selection(number_needed)
    return false unless coordinate_all_characters_valid?
    valid_sets = coordinate_scan_for_valid_sets
    unless valid_sets.length == number_needed
      Message.argument_mismatch(number_needed, valid_sets.length)
      return false
    end
    valid_sets
  end

  def coordinate_all_characters_valid?
    input_scan = @input.scan(/[^A-Z0-9 ]/)
    unless input_scan.empty?
      Message.invalid_characters(input_scan)
      return false
    end
    true
  end

  def coordinate_scan_for_valid_sets
    @input.scan(/[A-Z][0-9]+/).to_a
  end


end