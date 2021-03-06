require_relative "./displayer"
require_relative "./input_checker"
require_relative "./check_for_endgame"

class Controller

    attr_accessor :reset_message, :welcome_message, :invalid_input_message, :your_move_message, :move_already_made_message, :draw_message

    def initialize(input_controller, board, ai_input)
        @welcome_message = "Welcome to the game, type 'start' to begin.\n"
        @invalid_input_message = "Invalid input, try again.\n"
        @your_move_message = "Your move\n"
        @move_already_made_message = "Move already done, input new move\n"
        @draw_message = "THE GAME IS A DRAW -- YOU CANNOT DEFEAT ME\n"
        @lose_message = "YOU HAVE LOST AGAINST ME -- BOW TO MY SUPERIOR INTELLECT!\n"
        @reset_message = "Would you like to play again? Type 'reset' to confirm.\n"
        @board = board
        @input_controller = input_controller
        @ai_input = ai_input
    end

    def run_setup
        Displayer.print_message(@welcome_message)
        while true
            if @input_controller.start_game_input
                Displayer.display_board(@board.board_state)
                break
            else
                Displayer.print_message(@invalid_input_message)
            end
        end
    end

    def player_move(player_symbol = 'x')
        Displayer.print_message(@your_move_message)
        while true
            move = @input_controller.input_processor
            if move != false
                if InputChecker.check(move, @board.board_state)
                    @board.update_board(move, player_symbol)
                    Displayer.display_board(@board.board_state)
                    break
                else
                    Displayer.print_message(@move_already_made_message)
                end
            else
                Displayer.print_message(@invalid_input_message)
            end
        end
    end

    def get_ai_move(player_symbol = 'o')
        move = @ai_input.ai_move(@board.board_state)
        @board.update_board(move, player_symbol)
        Displayer.display_board(@board.board_state)
    end

    def game_loop
        
        run_setup()

        while true
            player_move('x')
            if CheckForEndGame.check_for_loss(@board.board_state) == 'loss'
                raise "This is never meant to happen"
                break
            elsif CheckForEndGame.check_for_loss(@board.board_state) == 'draw'
                Displayer.print_message(@draw_message)
                break
            end
            get_ai_move('o')
            if CheckForEndGame.check_for_loss(@board.board_state) == 'loss'
                Displayer.print_message(@lose_message) 
                break
            elsif CheckForEndGame.check_for_loss(@board.board_state) == 'draw'
                Displayer.print_message(@draw_message)
                break
            end
        end
        
        Displayer.print_message(@reset_message)
        if @input_controller.end_game_input
            @board.reset
            game_loop
        else
#exit but not exiting the tests
        end
        
    end

end
