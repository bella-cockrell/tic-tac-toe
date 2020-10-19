require_relative "input/input_controller"
require_relative "input/input_translator"
require_relative "input/input_validator"
require_relative "input/player_input"
require_relative "board"
require_relative "controller"
require_relative "ai"


input_controller = InputController.new(PlayerInput.new, InputValidator.new, InputTranslator.new)
board = Board.new
ai = AI.new
controller = Controller.new(input_controller, board, ai)

controller.game_loop