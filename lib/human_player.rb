class HumanPlayer
    def pick_secret_word
        puts "How long would you like your secret word to be?"
        length = nil
        until length
            input = gets.chomp.to_i
            length = input > 0 ? input : nil
        end
        length
    end
    
    def guess(board)
        p board
        input = nil
        while true
            puts "Guess a letter"
            input = gets.chomp.downcase
            break if ("a".."z").include?(input)
            puts "Input valid input"
        end
        input
    end
    
    def handle_response(guess, indicies)
        if indicies.length == 0
            puts "No letters were found"
        else
            str = indicies.reduce {|a,c| a.to_s + "," + (c+1).to_s}
            puts "The letter #{guess} was found at #{str}"
        end
    end
    
    def register_secret_length (lgth)
        puts "The Secret Word is #{lgth} letters long"
    end

    def check_guess (ltr)
        puts "The letter >> #{ltr} << was guessed"
    end

    def answer
        puts "What was the answer?"
        gets.chomp
    end
    
end