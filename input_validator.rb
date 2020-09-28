class InputValidator
    def first_input(player_input)
        if player_input.upcase == "START"
            return true
        else
            return false
        end
    end
end