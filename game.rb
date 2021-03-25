# frozen_string_literal: true

require './game_logic'
require './instructions'
require './text_content'
require './display'
require './game_io'

# Class used as central
class Game
  include Instructions
  include GameLogic
  include TextContent
  include Display
  include GameIO

  attr_accessor :code, :guesses, :tries

  def initialize
    @codeword = choose_codeword
    @guesses = ''
    @tries = 6
  end

  def start
    puts instructions

    # ask user if it wants to load a saved game
    if gets.chomp == 'load'
      saved_games_menu
    else
      puts turn_message('game_start')
    end

    run
  end

  def saved_games_menu
    saved_games = show_games_saved

    # ask user which game he wants to load
    puts load_game_message('choose_game')

    input = load_game_input(saved_games)

    load_game(saved_games[input])
    puts load_game_message('game_loaded')
  end

  def is_i?
    !!(self =~ /\A[-+]?[0-9]+\z/)
  end

  def load_game_input(saved_games)
    input = gets.chomp

    if input.is_i?
      input = input.to_i

      return input if input.between?(0, saved_games.length - 1)
    end

    puts load_game_message('invalid_input', saved_games.length - 1)
    load_game_input(saved_games)
  end

  def run
    take_turn while @tries.positive?

    # user ran out of tries
    game_over('no_tries', @codeword)
  end

  def take_turn
    puts "\n"
    puts turn_message('show_word_to_guess')
    show_guessed_word(@codeword, @guesses)
    show_available_letters(@guesses)
    puts turn_message('prompt_user', @tries)
    puts turn_message('other_options')

    guess = user_input

    puts "\n"

    return game_over('exit') if guess == 'exit'

    if guess == 'save'
      save_game
      puts load_game_message('game_saved')
      return take_turn
    end

    @guesses += guess

    # word does not contain guess
    if guess_in_word?(@codeword, guess)
      puts turn_message('guess_correct', nil, guess)
    else
      @tries -= 1
      puts turn_message('guess_wrong', nil, guess)
    end

    # newline
    puts ''

    # game won?
    game_over('winner') if word_guessed?(@codeword, @guesses)
  end

  def user_input
    input = gets.chomp
    # cases don't matter
    input.downcase!

    if input.match?(/^[a-z]$/)
      return input unless @guesses.include?(input)

      puts game_warning('already_guessed')

    end

    # TODO: Save functionality
    return input if input == 'save'

    return input if input == 'exit'

    # input invalid, call function again
    game_warning('invalid_input')
    user_input
  end

  def game_over(condition, codeword = nil)
    puts game_over_message(condition, codeword)
    puts "\n"
    puts game_over_message('new_game_prompt')

    input = gets.chomp

    Game.new.start if input == 'y'

    puts "Game EXIIIIIIIIIIIIIIIII"
  end

end

class String
  def is_i?
    !!(self =~ /\A[-+]?[0-9]+\z/)
  end
end
