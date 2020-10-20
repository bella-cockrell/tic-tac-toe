class InputValidator

    def first_input(player_input)
        if player_input.upcase == "START"
            return true
        else
            return false
        end
    end

    def end_game_input(player_input)
        if player_input.upcase == "RESET"
            return true
        else
            return false
        end
    end

    def player_move_input(player_input)
        player_input_no_whitespace = player_input.gsub(/\s+|[,-]/, "")
        if !!(player_input_no_whitespace.match(/([a-c A-C][123]|[123][a-c A-C])/))
            return true
        else
            return false
        end
    end
end

#create a function that clarifies what the Regex is doing, as Regex is hard to read