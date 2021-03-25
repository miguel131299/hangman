# frozen_string_literal: true

# Module used for basic game logic functions
module GameLogic
  NAME_OF_FILE = 'words.txt'

  def load_words
    File.new(NAME_OF_FILE)
  end

  def choose_codeword
    words = load_words

    word_array = words.readlines

    loop do
      codeword = word_array.sample

      next if codeword.nil?

      # remove '\n' end of line
      codeword.chomp!
      codeword.downcase!

      return codeword if codeword.length <= 12 && codeword.length >= 5
    end
  end

  def word_guessed?(codeword, guesses)
    codeword.each_char do |letter|
      return false unless guesses.include?(letter)
    end

    true
  end

  def guess_in_word?(codeword, guess)
    codeword.include?(guess)
  end
end
