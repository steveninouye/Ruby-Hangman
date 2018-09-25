require_relative "./lib/hangman.rb"
require_relative "./lib/utilities.rb"

if __FILE__ == $PROGRAM_NAME
    input = {:guesser => nil, :referee => nil}
    get_inputs(input)
    words = ComputerPlayer.get_words('./lib/dictionary.txt')
    guesser = input[:guesser] == "h" ? HumanPlayer.new : ComputerPlayer.new(words)
    referee = input[:referee] == "h" ? HumanPlayer.new : ComputerPlayer.new(words)
    game = Hangman.new({guesser: guesser, referee: referee})
    game.play
end