require_relative "./board"
require_relative "./input_validator"
require_relative "./input_translator"
require_relative "./interface"


class Controller

    attr_accessor :welcome_message, :invalid_input_message, :your_move_message, :move_already_made_message, :draw_message

    def initialize(input_controller)
        @welcome_message = "Welcome to the game, type 'start' to begin.\n"
        @invalid_input_message = "Invalid input, try again.\n"
        @your_move_message = "Your move\n"
        @move_already_made_message = "Move already done, input new move\n"
        @draw_message = "Game draw\n"
        @board = Board.new
        @input_controller = input_controller
    end
    #FIX FOLLOWING POSSIBLY CREATE MAIN CLASS TO NEW STUFF UP, LOOK AT RICHARD AND CLAIRE
    def run_setup
        Interface.print_message(@welcome_message)
        while true
            if @input_controller.start_game_input
                Interface.display_board(@board.board_state)
                break
            else
                Interface.print_message(@invalid_input_message)
            end
        end
    end

    def run_setup_v2
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

    def player_move(player_symbol = 'x')
        Interface.print_message(@your_move_message)
        while true
            move = Interface.receive_player_input
            if InputValidator.player_move_input(move)
                move = InputTranslator.standardize(move)
                move = InputTranslator.convert(move)
                if InputChecker.check(move, @board.board_state)
                    @board.update_board(move, player_symbol)
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

    def game_loop
        
        run_setup()

        while true
            player_move('x')
            if CheckForEndGame.check_for_loss(board_state) == 'loss'
                puts 'win'
            elsif CheckForEndGame.check_for_loss(board_state) == 'draw'
                puts 'draw'
            end
            player_move('o')
            if CheckForEndGame.check_for_loss(board_state) == 'loss'
                puts 'win'
            elsif CheckForEndGame.check_for_loss(board_state) == 'draw'
                puts 'draw'
            end
        end
    
    end

end
