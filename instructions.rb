# frozen_string_literal: true

# This module only contains instructions to be displayed at the beginning
module Instructions
  def instructions
    <<~HEREDOC
            #{'    '}
                  Welcome to Hangman!
                  This is a word guessing game. You will have 6 tries to try and figure out
                  which 5 to 12 characters is in front of you. Each time you guess, you will enter a letter of the alphabet.
                  If the word contains the letter you entered, the occurences of this character in the word will be shown to you.
                  If the word does not contain the character, you will lose on of your tries.
                  If you run out of tries before guessing every character, you lose the game.
      #{'      '}
                  If you want to load a game that you had previously saved, enter 'load'.
                  If not, just enter anything else!
      #{'      '}
                  Have fun!
            #{'          '}
    HEREDOC
  end
end
