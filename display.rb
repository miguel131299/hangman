module Display
    
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
end