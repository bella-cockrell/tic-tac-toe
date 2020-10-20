require_relative "../../lib/controller"
require_relative "../../lib/input/input_controller"
require_relative "../../lib/board"

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
    
describe "ATDD initialize" do
    context "when the player runs the program" do
        it "the game will output prompt, receive user input, then display an empty board" do
            #Arrange
            double_input_controller = double("Input_Controller")
            board = Board.new
            double_ai_input = double("AI Input")
            controller = Controller.new(double_input_controller, board, double_ai_input)
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
            board = Board.new
            double_ai_input = double("AI Input")
            controller = Controller.new(double_input_controller, board, double_ai_input)
            #Act
            allow(double_input_controller).to receive(:start_game_input).and_return(false, true)
            #Assert
            expect{controller.run_setup}.to output(/#{tic_tac_toe_string.join}/).to_stdout
        end          
        it "spy test: the game will output prompt, receive wrong user input, asks again, then displays board" do
            #Arrange
            spy_input_controller = spy("Input_Controller")
            board = Board.new
            double_ai_input = double("AI Input")
            controller = Controller.new(spy_input_controller, board, double_ai_input)
            #Act
            allow(spy_input_controller).to receive(:start_game_input).and_return(false, true)
            controller.run_setup
            #Assert
            expect(spy_input_controller).to have_received(:start_game_input).exactly(2).times
        end  
    end
end

describe "ATDD player move" do
    context "when the player wants to input a coord" do
        it "the player inputs a coord, then the board updates" do
            #Arrange
            double_input_controller = double("Input_Controller")
            board = Board.new
            double_ai_input = double("AI Input")
            controller = Controller.new(double_input_controller, board, double_ai_input)
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
        it "double test: asks for a new move" do
            #Arrange
            double_input_controller = double("Input_Controller")
            board = Board.new
            double_ai_input = double("AI Input")
            controller = Controller.new(double_input_controller, board, double_ai_input)
            move_again_message = controller.move_already_made_message
            #Act
            allow(double_input_controller).to receive(:input_processor).and_return([0, 0], [0, 0], [0, 1])
            controller.player_move
            #Assert
            expect{controller.player_move}.to output(/#{move_again_message}/).to_stdout
        end
        it "spy test: asks for a new move" do
            #Arrange
            spy_input_controller = spy("Input_Controller")
            board = Board.new
            double_ai_input = double("AI Input")
            controller = Controller.new(spy_input_controller, board, double_ai_input)
            #Act
            allow(spy_input_controller).to receive(:input_processor).and_return([0, 0], [0, 0], [0, 1])
            controller.player_move
            controller.player_move
            #Assert
            expect(spy_input_controller).to have_received(:input_processor).exactly(3).times
        end  
    end
    context "the player inputs an ending move" do
        it "returns a draw message" do
            #Arrange
            double_input_controller = double("Input_Controller")
            double_ai_input = double("AI Input")
            board = Board.new
            controller = Controller.new(double_input_controller, board, double_ai_input)
            draw_message = controller.draw_message
            #Act
            allow(double_input_controller).to receive(:input_processor).and_return([0,0], [1,1], [1,2], [0,1], [2,0])
            allow(double_ai_input).to receive(:ai_move).and_return([2,2], [0,2], [1,0], [2,1])
            allow(double_input_controller).to receive(:start_game_input).and_return(true)
            allow(double_input_controller).to receive(:end_game_input).and_return(false)
            #Assert
            expect{controller.game_loop}.to output(/#{draw_message}/).to_stdout
        end
    end
end

describe "ATDD AI" do
    context "when the player places x in the corner or on the sides" do
        it "the ai will go in the middle" do
            #arrange
            double_input_controller = double("Input_Controller")
            board = Board.new
            ai_player = AI.new
            controller = Controller.new(double_input_controller, board, ai_player)
            tic_tac_toe_string = [
                "    a     b     c  \n",
                "       |     |     \n",
                "1   x  |     |     \n",
                "  _____|_____|_____\n",
                "       |     |     \n",
                "2      |  o  |     \n",
                "  _____|_____|_____\n",
                "       |     |     \n",
                "3      |     |     \n",
                "       |     |     \n"
                ]
            joined_board = tic_tac_toe_string.join
            piped_board = joined_board.gsub('|','\|')
            #act
            allow(double_input_controller).to receive(:start_game_input).and_return(true)
            allow(double_input_controller).to receive(:input_processor).and_return([0,0], [1,0], [0,1])
            allow(double_input_controller).to receive(:end_game_input).and_return(false)
            #assert
            expect{controller.game_loop}.to output(/#{piped_board}/).to_stdout
        end
    end
end

# describe "ATDD Endgame" do
#     context "when the player completes a game and types 'reset'" do
#         it "the game restarts" do
#             #arrange
#             double_input_controller = double("Input_Controller")
#             board = Board.new
#             ai_player = AI.new
#             controller = Controller.new(double_input_controller, board, ai_player)
#             reset_message = controller.reset_message.gsub('?','\?')
#             joined_board = tic_tac_toe_string.join
#             piped_board = joined_board.gsub('|','\|')
#             #Act
#             allow(double_input_controller).to receive(:start_game_input).and_return(true)
#             allow(double_input_controller).to receive(:input_processor).and_return([0,0], [1,0], [0,1])
#             allow(double_input_controller).to receive(:end_game_input).and_return(true)
#             allow(double_input_controller).to receive(:start_game_input).and_return(true)
#             allow(double_input_controller).to receive(:input_processor).and_return([0,0], [1,0], [0,1])
#             allow(double_input_controller).to receive(:end_game_input).and_return(false)
#             #assert
#             expect{controller.game_loop}.to output(/#{reset_message}/).to_stdout
#             expect{controller.game_loop}.to output(/#{piped_board}/).to_stdout
#         end
#     end
# end