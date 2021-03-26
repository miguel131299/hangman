# frozen_string_literal: true

# Mofule used to save messages to be displayed to the user under certain conditions
module TextContent
  def turn_message(message, tries = nil, guess = nil)
    {
      'game_start' => "The computer has chosen the codeword and now it's your turn to decipher it",
      'prompt_user' => "Please choose a letter of the alphabet that the codeword might contain. You have #{tries} tries left",
      'other_options' => "If you want to exit the game, just enter 'exit'. If you want to save the game, enter 'save'",
      'show_word_to_guess' => 'This is what you have guessed until now:',
      'guess_correct' => 'Super! Your guess was right!',
      'guess_wrong' => "Sorry! The codeword did not contain the letter #{display_red(guess)}"
    }[message]
  end

  def game_warning(message)
    {
      'already_guessed' => 'Please choose a letter that you have not guessed before',
      'invalid_input' => 'Invalid Input. Please choose a single letter that has not been guessed yet'
    }[message]
  end

  def game_over_message(message, codeword = nil)
    {
      'winner' => "Congratulations! You successfully guessed the word #{display_green(codeword)}. You Rock!",
      'exit' => 'Game exited',
      'no_tries' => "Game over! You ran out of tries. The word you were trying to guess was #{display_red(codeword)}",
      'new_game_prompt' => "If you would like to play again, please enter 'y'. If not please enter anything else"
    }[message]
  end

  def load_game_message(message, limit = nil)
    {
      'choose_game' => 'Which game would you like to continue with? Enter the index to choose a game',
      'invalid_input' => "Please choose a number between 0 and #{limit}",
      'game_loaded' => 'Game has been succesfully loaded!',
      'game_saved' => 'Game was succesfully saved!'
    }[message]
  end
end
