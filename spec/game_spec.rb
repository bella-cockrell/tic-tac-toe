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
        it "outputs the welcome prompt" do
            expect{game.welcome_message}.to output("Welcome to the game, type 'start' to begin.\n").to_stdout
        end
        it "incase of invalid input - asks again" do
            allow(game).to receive(:gets).and_return("end\n", "START\n")
            expect{game.get_init_input}.to output("Try again.\n").to_stdout
        end
        it "incase of valid input - returns start" do
            allow(game).to receive(:gets).and_return("START\n")
            expect(game.get_init_input_and_compare).to eq("START")
        end
        it "incase of lowercase valid input - returns start" do
            allow(game).to receive(:gets).and_return("start\n", "START\n")
            expect(game.get_init_input_and_compare).to eq("START")
        end

        # xit "takes a player's input and checks that it's 'start'" do
        #     allow(game).to receive(:gets).and_return("START")
        #     expect(game.start_input.upcase).to eq("START")
        # end
        # xit "after player input, print board" do
        #     board = Board.new
        #     #game.start_game
        #     expect(game.start_game).to eq(tic_tac_toe_string)
        # end
    end
end