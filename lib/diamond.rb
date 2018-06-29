class Diamond
  def build(max_letter)
    return '' if max_letter.class != String
    return '' if max_letter.empty?

    @letters = ('A' .. max_letter.upcase).to_a

    diamond_maker
  end

  private

  def diamond_maker
    diamond = []

    # Build the diamond's first half
    # And the middle line
    @letters.each { |array_letter|
      diamond << new_line(array_letter)
    }

    # The Diamond base is exactly the same
    # of the first half, minus the middle line.
    # Just insert the first half (minus the middle(last) line)
    # and reverse it.
    diamond << diamond[0..-2].reverse

    # Make it a one-dimentional string
    diamond.join
  end

  def letter_or_underscore(array_letter, letter)
    (array_letter == letter) ? letter : '_'
  end

  def new_line(letter)
    line = []

    # First half of the line
    @letters.reverse.each { |array_letter|
      line << letter_or_underscore(array_letter, letter)
    }

    # Last half of the line
    @letters[1..-1].each { |reverserd_array_letter|
      line << letter_or_underscore(reverserd_array_letter, letter)
    }

    line << "\n"
  end
end
