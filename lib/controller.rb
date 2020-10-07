require_relative "./board"
require_relative "./input_validator"
require_relative "./input_translator"
require_relative "./interface"


class Controller

    attr_accessor :welcome_message, :invalid_input_message

    def initialize
        @welcome_message = "Welcome to the game, type 'start' to begin.\n"
        @invalid_input_message = "Invalid input, try again.\n"
        @your_move_message = "Your move\n"
        @board = Board.new
    end
    
    def run_setup
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

    def player_move
        Interface.print_message(@your_move_message)
        while true
            move = Interface.receive_player_input
            if InputValidator.player_move_input(move)
                move = InputTranslator.standardize(move)
                move = InputTranslator.convert(move)
                #checker
                @board.update_board(move, "x")
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

controller = Controller.new
controller.run_setup
controller.player_move