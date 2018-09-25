class ComputerPlayer
    def self.get_words(file)
      File.readlines(file).map(&:chomp)
    end

    attr_reader :candidate_words

    def initialize (dictionary)
      @dictionary = dictionary
    end

    def answer
      @secret_word
    end
  
    def check_guess (ltr)
      result = []
      @secret_word.split("").each_with_index do |el,idx|
        result.push(idx) if ltr == el
      end
      result
    end

    def guess (board)
      str = @candidate_words.reduce {|a,c| a + c }
      ltr_count = count_num_letters(str, board)
      ltr_count.max_by{|k,v| v}.first
    end

    def handle_response (ltr, indicies)
      @candidate_words.delete_if do |word|
        indicies != (0...word.length).find_all {|i| word[i] == ltr}
      end
    end
  
    def pick_secret_word
      @secret_word = @dictionary.sample
      @secret_word.length
    end
  
    def register_secret_length (lgth)
      @candidate_words = @dictionary.select{|word| word.length == lgth}
    end
  
    private
    def count_num_letters(str, board)
      str.chars.reduce(Hash.new(0)) do |hash,ltr|
        hash[ltr] += 1 if !board.include?(ltr)
        hash
      end
    end
end