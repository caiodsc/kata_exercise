# frozen_string_literal: true

require_relative 'assertions'
require_relative 'diamond_line'

class Diamond
  include Assertions

  attr_reader :width

  def build(letter)
    assert { letter.is_a?(String) && ('A'..'Z').include?(letter) }

    @letter = letter
    @preceding = (letter.ord - 1).chr
    @width = 2 * (letter.ord - 'A'.ord) + 1

    diamond + "\n"
  end

  private

  def diamond
    return 'A' if @letter == 'A'

    letters = 'A'.upto(@letter) + 'A'.upto(@preceding).reverse_each

    letters.map { |letter| diamond_line(letter) }.join("\n")
  end

  def diamond_line(letter)
    DiamondLine.new(letter, self).build
  end
end
