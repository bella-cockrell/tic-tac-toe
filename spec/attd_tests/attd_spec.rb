require_relative "../../lib/game"
require_relative "../../lib/player"

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
    # given a player wants to play the game  
    # when the player starts the program
    # then the game displays a board
    context "when the player runs the program" do
        it "the game will output prompt, receive user input, then display an empty board" do
            #Arrange
            game = Game.new
            player = Player.new
            allow(player).to receive(:gets).and_return("start")
            expect(game.main).to eq(true)
        end  
    end
end

describe "ATTD player move" do
    # given that the player wants to input a coord
    # when the player inputs a  coord
    # then board updates
    context "when the player wants to input a coord" do
        xit "the player inputs a coord, then the board updates" do
            expect(game.move).to eq(true)
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

