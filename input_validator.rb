class InputValidator
    def first_input(player_input)
        if player_input.upcase == "START"
            return true
        else
            return false
        end
    end
    def player_move_input(player_input)
        player_input_split = player_input.split
        if player_input_split[0] == "A" || 
            player_input_split[0] == "B" ||
            player_input_split[0] == "C"
            return true
        else
            return false
        end
    end
end