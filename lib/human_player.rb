class HumanPlayer
    def answer
        puts "What was the answer?"
        gets.chomp
    end

    def check_guess (ltr)# I NEED TO VERIFY THIS WORKS
        puts "The letter >> #{ltr} << was guessed"
        puts "Is this Correct? yes(y) / no(n)"
        input = gets.chomp
        return [] if input == "n"
        puts "What positions are the letters? (e.g. 2 4)"
        get_indicies
    end

    def guess(board)
        p board
        input = nil
        while true
            puts "Guess a letter"
            input = gets.chomp.downcase
            break if ("a".."z").include?(input) && input.length == 1
            puts "Input valid input"
        end
        input
    end

    def handle_response(ltr, indicies)
        if indicies.length == 0
            puts "No letters were found"
        else
            str = indicies.reduce {|a,c| (a+1).to_s + "," + (c+1).to_s}
            puts "The letter #{ltr} was found at #{str}"
        end
    end

    def pick_secret_word
        puts "How long would you like your secret word to be?"
        @secret_word_length = nil
        until @secret_word_length
            input = gets.chomp.to_i
            @secret_word_length = input > 0 ? input : nil
        end
        @secret_word_length
    end
    
    def register_secret_length (lgth)
        puts "The Secret Word is #{lgth} letters long"
    end

    private
    def get_indicies # I NEED TO VERIFY THIS WORKS
        begin
            input = gets.chomp
            indices = input.split.map(|num| Integer(num) - 1)
            raise "Invalid Index" if indices.some?(|i| i > @secret_word_length - 1)
            indices
        rescue ArgumentError
            puts "INVALID INPUT"
            puts "Enter a valid positions or 'none'"
            retry
        end
    end
end