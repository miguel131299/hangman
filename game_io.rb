# frozen_string_literal: true

require 'json'

# Module used to save and load game state
module GameIO
  def save_game
    content = JSON.dump({
                          codeword: @codeword,
                          guesses: @guesses,
                          tries: @tries
                        })

    file = File.new("saved/#{Time.now.ctime}.json", 'w')
    file.puts(content)
    file.close

    file
  end

  def load_game(string)
    file = File.open("saved/#{string}", 'r')
    contents = file.read
    data = JSON.parse(contents)

    @codeword = data['codeword']
    @guesses = data['guesses']
    @tries = data['tries']
  end

  def show_games_saved
    saved_games = Dir.entries('./saved')

    # remove current dir and parent dir
    saved_games.delete('.')
    saved_games.delete('..')

    puts "\nThese are the currently saved games: \n"
    saved_games.each_with_index do |file, index|
      puts "#{index}. #{file} "
    end

    # return saved games
    saved_games
  end
end
