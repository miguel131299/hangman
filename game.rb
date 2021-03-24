require './game_logic'
require './instructions'
require './text_content.rb'
require './display.rb'

class Game
    include Instructions
    include GameLogic
    include TextContent
    include Display

    attr_reader :code, :guesses, :tries

    def initialize
        @codeword = choose_codeword
        @guesses = ""
        @tries = 6
    end

    def start
        puts instructions
        puts turn_message('game_start')

        run
    end

    def run
        
        while @tries > 0
            take_turn
        end

        #user ran out of tries
        game_over('no_tries')
    end

    def take_turn
        puts turn_message('show_word_to_guess')
        show_guessed_word(@codeword, @guesses)
        puts turn_message('prompt_user', @tries)


        guess = user_input

        if guess == "exit"
            game_over('exit')
        end

        @guesses += guess

        #word does not contain guess
        unless guess_in_word?(@codeword, guess)
            @tries -= 1
            puts turn_message('guess_wrong', guess)
        else
            puts turn_message('guess_correct')
        end

        #newline
        puts ""

        #game won?
        if word_guessed?(@codeword, @guesses)
            game_over('winner')
        end

    end

    def user_input
        input = gets.chomp
        #cases don't matter
        input.downcase!
        
        if input.match?(/^[a-z]$/)
            if @guesses.include?(input)
                puts game_warning('already_guessed')
            else
                return input
            end
        end

        #TODO: Save functionality
        # return input if input == "save"

        return input if input == "exit"

        #input invalid, call function again
        game_warning('invalid_input')
        user_input
    end

    def game_over(condition)
        #TODO: IMPLEMENT
    end
end