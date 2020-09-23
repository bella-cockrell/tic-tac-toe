require_relative '../board'

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
    context "when the player starts the program" do
        it "then the game displays a board" do
            board = Board.new
            expect(board.game_board).to eq(tic_tac_toe_string)
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

