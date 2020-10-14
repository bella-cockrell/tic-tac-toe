require_relative "input/input_controller"
require_relative "input/input_translator"
require_relative "input/input_validator"
require_relative "input/player_input"
require_relative "board"
require_relative "controller"


input_controller = InputController.new(PlayerInput.new, InputValidator.new, InputTranslator.new)
board = Board.new
controller = Controller.new(input_controller, board)

controller.game_loop