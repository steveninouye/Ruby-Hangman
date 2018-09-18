class Hangman
  attr_reader :guesser, :referee, :board

  def initialize (players)
    @guesser = players[:guesser]
    @referee = players[:referee]
    @board = 0
  end

  def setup
    num = @referee.pick_secret_word
    @guesser.register_secret_length(num)
    @board = num
  end

  def take_turn

  end

end

class HumanPlayer
  def register_secret_length (lgth)

  end

  def guess(args)
  end
end

class ComputerPlayer
  def initialize (dictionary)
    @dictionary = dictionary
  end

  def pick_secret_word
    @dictionary[0].length
  end

  def check_guess (ltr)
    word = @dictionary[0]
    result = []
    word.chars.each_with_index do |el,idx|
      result.push(idx) if ltr == el
    end
    result
  end

end
