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
    context "when the player runs the program" do
        xit "the game will output prompt, receive user input, then display an empty board" do
            game = Game.new
            prompt = "Welcome to the game, type 'start' to begin."
            #Game outputs prompt
            expect(game.start).to eq(prompt)
            #Game gets user input
            expect(game.start(input)).to eq("Start")
            #Game outputs board
            expect(game.start.board).to eq(Board.new.display_board)
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

