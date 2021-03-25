module Display

    ALPHABET = "abcdefghijklmnopqrstuvwxyz"
    
    def show_guessed_word(codeword, guesses)
        result = ""

        codeword.each_char do |letter|
            if guesses.include?(letter)
                result += letter
            else
                result += " _ "
            end
        end

        puts result + "\n\n"
    end

    def show_available_letters(guesses)
        available = ""
        ALPHABET.each_char do |char|
            available += char unless guesses.include?(char)
        end
        puts "These are the available letters: #{available}"
    end
end