require_relative "../../lib/controller"


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
            controller = Controller.new
            #Act
            allow(Interface).to receive(:receive_player_input).and_return("start")
            #Assert
            expect{controller.run_setup}.to output(/#{tic_tac_toe_string.join}/).to_stdout
        end  
    end
    context "when the player runs the program" do
        it "the game will output prompt, receive wrong user input, asks again, then displays board" do
            #Arrange
            controller = Controller.new
            welcome_message = controller.welcome_message
            invalid_input_message = controller.invalid_input_message
            #Act
            allow(Interface).to receive(:receive_player_input).and_return("ergijhf", "start")
            #Assert
            expect{controller.run_setup}.to output(/#{tic_tac_toe_string.join}/).to_stdout
        end  
    end
end

describe "ATTD player move" do
    context "when the player wants to input a coord" do
        it "the player inputs a coord, then the board updates" do
            #Arrange
            controller = Controller.new
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
            allow(Interface).to receive(:receive_player_input).and_return("A1")
            #Assert
            expect{controller.player_move}.to output(/#{tic_tac_toe_string.join}/).to_stdout
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

