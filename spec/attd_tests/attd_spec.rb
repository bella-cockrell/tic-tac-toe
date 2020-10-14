require_relative "../../lib/controller"
require_relative "../../lib/input_controller"

tic_tac_toe_string = [
    "    a     b     c  \n",
    "       |     |     \n",
    "1      |     |     \n",
    "  _____|_____|_____\n",
    "       |     |     \n",
    "2      |     |     \n",
    "  _____|_____|_____\n",
    "       |     |     \n",
    "3      |     |     \n",
    "       |     |     \n"
]
    
describe "ATTD initialize" do
    context "when the player runs the program" do
        it "the game will output prompt, receive user input, then display an empty board" do
            #Arrange
            double_input_controller = double("Input_Controller")
            controller = Controller.new(double_input_controller)
            #Act
            allow(double_input_controller).to receive(:start_game_input).and_return(true)
            #Assert
            expect{controller.run_setup}.to output(/#{tic_tac_toe_string.join}/).to_stdout
        end  
    end
    context "when the player runs the program" do
        it "double test: the game will output prompt, receive wrong user input, asks again, then displays board" do
            #Arrange
            double_input_controller = double("Input_Controller")
            controller = Controller.new(double_input_controller)
            #Act
            allow(double_input_controller).to receive(:start_game_input).and_return(false, true)
            #Assert
            expect{controller.run_setup}.to output(/#{tic_tac_toe_string.join}/).to_stdout
        end          
        it "spy test: the game will output prompt, receive wrong user input, asks again, then displays board" do
            #Arrange
            spy_input_controller = spy("Input_Controller")
            controller = Controller.new(spy_input_controller)
            #Act
            allow(spy_input_controller).to receive(:start_game_input).and_return(false, true)
            controller.run_setup
            #Assert
            expect(spy_input_controller).to have_received(:start_game_input).exactly(2).times
        end  
    end
end

describe "ATTD player move" do
    context "when the player wants to input a coord" do
        it "the player inputs a coord, then the board updates" do
            #Arrange
            double_input_controller = double("Input_Controller")
            controller = Controller.new(double_input_controller)
            tic_tac_toe_string = [
            "    a     b     c  \n",
            "       |     |     \n",
            "1   x  |     |     \n",
            "  _____|_____|_____\n",
            "       |     |     \n",
            "2      |     |     \n",
            "  _____|_____|_____\n",
            "       |     |     \n",
            "3      |     |     \n",
            "       |     |     \n"
            ]
            #Act
            joined_board = tic_tac_toe_string.join
            piped_board = joined_board.gsub('|','\|')
            allow(double_input_controller).to receive(:input_processor).and_return([0, 0])
            #Assert
            expect{controller.player_move}.to output(/#{piped_board}/).to_stdout
        end
    end
    context "when the player wants to input a coord and theres already an input there" do
        it "asks for a new move" do
            #Arrange
            controller = Controller.new
            move_again_message = controller.move_already_made_message
            #Act
            allow(Interface).to receive(:receive_player_input).and_return("A1", "A1", "B1")
            controller.player_move
            #Assert
            expect{controller.player_move}.to output(/#{move_again_message}/).to_stdout
        end
    end
    xcontext "the player inputs an ending move" do
        it "returns a draw message" do
            #Arrange
            controller = Controller.new
            draw_message = controller.draw_message
            #Act
            allow(STDIN).to receive(:gets).and_return("A1", "C3", "B2", "C1", "C2", "A2", "B1", "B3", "A3")
            #Assert
            expect{controller.game_loop}.to output(/#{draw_message}/).to_stdout
        end
    end
end





#     a     b     c  
#        |     |     
# 1   -  |  -  |  -  
#   _____|_____|_____
#        |     |     
# 2   -  |  -  |  -  
#   _____|_____|_____
#        |     |     
# 3   -  |  -  |  -  
#        |     |     

