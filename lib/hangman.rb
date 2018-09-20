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
    x = @guesser.guess
    @referee.check_guess(x)
    update_board
    @guesser.handle_response
  end

  def update_board
  end

end

class HumanPlayer
  def register_secret_length (lgth)

  end

  def guess(args)
    args
  end

  def handle_response
  end
end

class ComputerPlayer
  attr_reader :candidate_words

  def initialize (dictionary)
    @dictionary = dictionary
  end

  def pick_secret_word
    @secret_word = @dictionary.sample
    @secret_word.length
  end

  def check_guess (ltr)
    word = @dictionary[0]
    result = []
    word.chars.each_with_index do |el,idx|
      result.push(idx) if ltr == el
    end
    result
  end

  def register_secret_length (lgth)
    @candidate_words = @dictionary.select{|el| el.length == lgth}
  end

  def guess (board)
    ("a".."z").to_a[rand(26)]
  end

  def handle_response (ltr, arr)

  end

  def candidate_words

  end
end
