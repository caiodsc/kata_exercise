# frozen_string_literal: true

class DiamondLine
  def initialize(letter, diamond)
    @letter = letter
    @position = letter.ord - 'A'.ord
    @width = diamond.width
  end

  def build
    if @letter == 'A'
      spaces_beyond + 'A' + spaces_beyond
    else
      spaces_beyond + @letter + spaces_between + @letter + spaces_beyond
    end
  end

  def spaces_beyond
    return '_' * (@width / 2) if @letter == 'A'

    '_' * ((@width - spaces_between.length - 2) / 2)
  end

  def spaces_between
    '_' * ((2 * @position) - 1)
  end
end
