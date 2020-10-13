class InputController

    def initialize(player_input, input_validator, input_translator)
        @player_input = player_input
        @input_validator = input_validator
        @input_translator = input_translator
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

end