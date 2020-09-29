require_relative "./board"
require_relative "./player"
require_relative "./general_messages"
require_relative "./input_validator"

class InitializeGame
    def run_setup
        GeneralMessages.new.welcome_message
        while true 
            if InputValidator.new.first_input(Player.new.receive_input)
                Board.new.display_board
                return true
            else
                GeneralMessages.new.invalid_input_message
            end
        end
    end
end

