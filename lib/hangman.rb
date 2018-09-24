class Hangman
  attr_reader :guesser, :referee, :board

  def initialize (players)
    @guesser = players[:guesser]
    @referee = players[:referee]
    @guesses_available = 6
  end

  def play
    setup
    # need to work on this
    while @guesses_available > 0
      take_turn
    end
  end

  def setup
    lgth = @referee.pick_secret_word
    @guesser.register_secret_length(lgth)
    @board = [nil] * lgth
  end

  def take_turn
    guess = @guesser.guess(@board)
    correct_idxs = @referee.check_guess(guess)
    update_board(guess, correct_idxs)
    @guesser.handle_response(guess, correct_idxs)
  end

  def update_board(ltr, indicies)
    indicies.each do |idx|
      @board[idx] = ltr
    end
  end

end

class HumanPlayer
  def register_secret_length (lgth)
    p "The Secret Word is #{lgth} letters long"
  end

  def guess(board)
    p board
    input = nil
    while true
      p "Guess a letter"
      input = gets.chomp.downcase
      break if ("a".."z").include?(input)
      p "Input valid input"
    end
    input
  end

  def handle_response(guess, indicies)
    str = indicies.reduce("") {|a,c| a + "," + (c+1).to_s}
    p "The letter #{guess} was found at #{str}"
  end

  def pick_secret_word
    p "How long would you like your secret word to be?"
    length = nil
    until length
      input = gets.chomp.to_i
      length = input > 0 ? input : nil
    end
    length
  end
end

class ComputerPlayer
  attr_reader :candidate_words

  def self.get_words(file)
    File.readlines(file).map(&:chomp)
  end

  def initialize (dictionary)
    @dictionary = dictionary
  end

  def pick_secret_word
    @secret_word = @dictionary.sample
    p @secret_word
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
  
  def handle_response (ltr, indicies)
    @candidate_words.delete_if do |word|
      indicies != (0...word.length).find_all {|i| word[i] == ltr}
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

guesser = HumanPlayer.new
referee = ComputerPlayer.new(ComputerPlayer.get_words('./lib/dictionary.txt'))

game = Hangman.new({guesser: guesser, referee: referee})
game.play