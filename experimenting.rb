require 'colorize'

p String.colors
p String.disable_colorization

p "+---+---+---+---+---+".colorize(:light_white)

class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def blue
    colorize(34)
  end

  def pink
    colorize(35)
  end

  def light_blue
    colorize(36)
  end
end

p "HEEY".colorize(31)

string = "HEEY"

ESC = "\e["

NND = "#{ESC}0m"

colors ||= (31..36).to_a
c = colors[0]

p "#{ESC}#{c}m#{string}#{NND}"
