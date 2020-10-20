class InputController

    def initialize(player_input, input_validator, input_translator)
        @player_input = player_input
        @input_validator = input_validator
        @input_translator = input_translator
    end

    def start_game_input
        start_input = @player_input.receive_player_input
        @input_validator.first_input(start_input)
    end

    def input_processor
        move = @player_input.receive_player_input
        if @input_validator.player_move_input(move)
            move = @input_translator.standardize(move)
            move = @input_translator.convert(move)
        else
            return false
        end
        return move
    end

    def end_game_input
    end_input = @player_input.receive_player_input
    @input_validator.end_game_input(end_input)
    end

end