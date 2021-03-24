module GameLogic

    NAME_OF_FILE = "words.txt"
    
    def load_words
        File.new(NAME_OF_FILE)
    end

    def choose_codeword
        words = load_words

        word_array = words.readlines

        loop do

            codeword = word_array.sample

            if codeword.nil?
                next
            end

            return codeword if (codeword.length <= 12 && codeword.length >= 5)
        end
    end

    def word_guessed?(codeword, guesses)
        
        codeword.each_char do |letter|
            if !(guesses.include?(letter))
                return false
            end
        end

        return true
    end

    def guess_in_word?(codeword, guess)
        return codeword.include?(guess)
    end
end