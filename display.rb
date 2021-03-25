# frozen_string_literal: true

# Module used to output information to the terminal
module Display
  ALPHABET = 'abcdefghijklmnopqrstuvwxyz'

  def show_guessed_word(codeword, guesses)
    result = ''

    codeword.each_char do |letter|
      result += if guesses.include?(letter)
                  letter
                else
                  ' _ '
                end
    end

    puts "#{result}\n\n"
  end

  def show_available_letters(guesses)
    available = ''
    ALPHABET.each_char do |char|
      available += char unless guesses.include?(char)
    end
    puts "These are the available letters: #{available}"
  end

  def display_red(message)
    "\e[38;5;196m#{message} \e[0m"
  end
end
