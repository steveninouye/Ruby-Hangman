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
    lgth = @referee.pick_secret_word
    @guesser.register_secret_length(lgth)
    @board = [nil] * lgth
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
    @secret_word.split("").each_with_index do |el,idx|
      result.push(idx) if ltr == el
    end
    result
  end

  def register_secret_length (lgth)
    @candidate_words = @dictionary.select{|word| word.length == lgth}
  end
  
  def handle_response (ltr, indices)
    @candidate_words.delete_if do |word|
      indices != (0...word.length).find_all {|i| word[i] == ltr}
    end
  end
  
  def guess (board)
    str = @candidate_words.reduce {|a,c| a + c }
    ltr_count = count_num_letters(str, board)
    ltr_count.max_by{|k,v| v}.first
  end

  private
  def count_num_letters(str, board)
    str.chars.reduce(Hash.new(0)) do |hash,ltr|
      hash[ltr] += 1 if !board.include?(ltr)
      hash
    end
  end
end
