module TextContent
    
    def turn_message(message, tries = nil, guess = nil)
        {
            'game_start' => "The computer has chosen the codeword and now it's your turn to decipher it",
            'prompt_user' => "Please choose a letter of the alphabet that the codeword might contain. You have #{tries} tries left",       
            'show_word_to_guess' => "This is what you have guessed until now:",
            'guess_correct' => "Super! Your guess was right!",
            'guess_wrong' => "Sorry! The codeword did not contain the letter #{guess}"
        }[message]
    end

    def game_warning(message)
        {
            'already_guessed' => "Please choose a letter that you have not guessed before",
            'invalid_input' => "Invalid Input. Please choose a single letter that has not been guessed yet"
        }[message]
    end
end