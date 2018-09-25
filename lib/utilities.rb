def get_inputs(obj)
    obj.each_key do |key|
      until is_valid_input(obj[key])
        puts "Who will be the #{key.to_s}? Human(h) / Computer (c)"
        obj[key] = gets.chomp.downcase
        display_invalid_input if !is_valid_input(obj[key])
      end
    end
end
  
def display_invalid_input
    puts "INPUT NOT VALID"
    puts "Enter 'h' for Human or 'c' for Computer"
end

def is_valid_input(input)
    return true if input == "h" || input == "c"
    false
end