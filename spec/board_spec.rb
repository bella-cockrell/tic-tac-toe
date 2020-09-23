require_relative '../board'

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

describe Board do
    context "player begins game" do
        it "initializes the board" do
            test_board = Board.new
            expect(!!(test_board.game_board)).to eq(true)
        end
        it "sets the empty game board" do
            test_board = Board.new
            expect(test_board.game_board).to eq(tic_tac_toe_string)
        end
    end
end