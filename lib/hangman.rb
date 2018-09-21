class Hangman
  attr_reader :guesser, :referee, :board

  def initialize (players)
    @guesser = players[:guesser]
    @referee = players[:referee]
    @guesses_available = 6
  end

  def play
    while @guesses_available > 0
      
    end
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
    # prints to reader how long the length is
  end

  def guess(arg)
    # diplays the board and returns the user's guess
  end

  def handle_response(guess, idx)
    str = idx.reduce("") {|a,c| a + "," + (c+1).to_s}
    p "The letter #{guess} was found at #{str}"
  end

  def pick_secret_word
    # displays directions to user to pick lenght of word
    # gets user input and verifies it is an valid input
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
    result = []
    @secret_word.each_with_index do |el,idx|
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
    arr
  end

  def candidate_words

  end
end
