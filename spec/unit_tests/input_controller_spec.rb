require_relative "../../lib/input_controller"
require_relative "../../lib/player_input"
require_relative "../../lib/input_validator"
require_relative "../../lib/input_translator"

describe InputController do
    context "when asked for input" do
        it "returns player coord" do
            #Arrange
            player_input = PlayerInput.new
            input_validator = InputValidator.new
            input_translator = InputTranslator.new
            input_controller = InputController.new(player_input, input_validator, input_translator)
            #Act
            allow(player_input).to receive(:receive_player_input).and_return("A 1")
            #Assert
            expect(input_controller.input_processor).to eq([0, 0])
        end
        it "returns player coord" do
            #Arrange
            player_input = PlayerInput.new
            input_validator = InputValidator.new
            input_translator = InputTranslator.new
            input_controller = InputController.new(player_input, input_validator, input_translator)
            #Act
            allow(player_input).to receive(:receive_player_input).and_return("B 2")
            #Assert
            expect(input_controller.input_processor).to eq([1, 1])
        end
    end
end