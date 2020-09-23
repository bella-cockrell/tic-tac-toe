require_relative '../game'

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

describe Game do
    game = Game.new
    context "when player loads program" do
        it "initializes the game object" do
            expect(!!(game)).to eq(true)
        end
        it "outputs a prompt" do
            expect(game.welcome_message).to eq("Welcome to the game, type 'start' to begin.")
        end
        it "takes a player's input and checks that its start" do
            #Arrange
            game.start_game
            #Act/Assert
            expect(game.start_input.upcase).to eq("START")
        end
        it "after player input, print board" do
            #Arrange
            board = Board.new
            #game.start_game
            #Act/Assert
            expect(game.start_game).to eq(tic_tac_toe_string)
        end
    end
end