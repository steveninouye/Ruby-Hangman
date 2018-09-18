class Hangman
  attr_reader :guesser, :referee, :board

  def initialize (guesser, referee, board)
    @guesser = guesser
    @referee = referee
    @board = board
  end
end

class HumanPlayer
end

class ComputerPlayer
end
