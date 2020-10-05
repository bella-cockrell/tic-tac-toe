require_relative "./board"
require_relative "./player"
require_relative "./general_messages"
require_relative "./input_validator"


class Controller

    def initialize
        @welcome_message = "Welcome to the game, type 'start' to begin.\n"
        @invalid_input_message = "Invalid input, try again.\n"
    end
    
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

    

    

    # request input
    # validates
    # loop
end
