require_relative "./board"
require_relative "./input_validator"
require_relative "./input_translator"
require_relative "./interface"


class Controller

    attr_accessor :welcome_message, :invalid_input_message

    def initialize
        @welcome_message = "Welcome to the game, type 'start' to begin.\n"
        @invalid_input_message = "Invalid input, try again.\n"
        @board = Board.new
    end
    
    def run_setup
        # GeneralMessages.new.welcome_message
        # while true 
        #     if InputValidator.new.first_input(Player.new.receive_input)
        #         Board.new.display_board
        #         return true
        #     else
        #         GeneralMessages.new.invalid_input_message
        #     end
        # end
        

        Interface.print_message(@welcome_message)
        while true
            if InputValidator.first_input(Interface.receive_player_input)
                Interface.display_board(@board.board_state)
                break
            else
                Interface.print_message(@invalid_input_message)
            end
        end

    end

    

    

    # request input
    # validates
    # loop
end
