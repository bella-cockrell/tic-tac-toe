require_relative "../../game"

# given a player wants to play the game  
# when the player starts the program
# then the game displays a board

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
    
describe "ATTD Board" do
    context "when the player runs the program" do
        it "the game will output prompt, receive user input, then display an empty board" do
            #Arrange
            game = Game.new
            expect(game.main).to eq(true)
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

