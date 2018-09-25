require_relative "./computer_player.rb"
require_relative "./human_player.rb"

class Hangman
  attr_reader :guesser, :referee, :board

  def initialize (players)
    @guesser = players[:guesser]
    @referee = players[:referee]
    @guesses_available = 6
  end

  def play
    setup
    while @guesses_available > 0 && !won?
      is_guess_incorrect = take_turn
      @guesses_available -= 1 if is_guess_incorrect
    end
    conclude_game
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
    correct_idxs.length == 0
  end

  def update_board(ltr, indicies)
    indicies.each do |idx|
      @board[idx] = ltr
    end
  end

  def won?
    @board == @board.compact
  end

  def conclude_game
    puts game_result
    puts "The Correct answer is #{@referee.answer}"
  end
  
  def game_result
    return "You won the game!" if won?
    "You have run out of guesses"
  end
end



