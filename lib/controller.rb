require_relative "./board"
require_relative "./input_validator"
require_relative "./input_translator"
require_relative "./interface"


class Controller

    attr_accessor :welcome_message, :invalid_input_message, :your_move_message, :move_already_made_message, :draw_message

    def initialize
        @welcome_message = "Welcome to the game, type 'start' to begin.\n"
        @invalid_input_message = "Invalid input, try again.\n"
        @your_move_message = "Your move\n"
        @move_already_made_message = "Move already done, input new move\n"
        @draw_message = "Game draw\n"
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
                if InputChecker.check(move, @board.board_state)
                    @board.update_board(move, "x")
                    Interface.display_board(@board.board_state)
                    break
                else
                    Interface.print_message(@move_already_made_message)
                end
            else
                Interface.print_message(@invalid_input_message)
            end
        end
    end

    # def game_loop
        
    #     controller.run_setup

    #     while true
    #         controller.player_move
    #         if check_for_win.check_for_loss(board_state) == 'loss'
                
    #         end
    #         controller.AI_move
    #         if check_for_win == true; controller.end_game; break
    #     controller.end_game
    
    # end

end
