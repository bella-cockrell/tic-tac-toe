require_relative '../../lib/board'

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
    test_board = Board.new
    context "player begins game" do
        it "initializes the board" do
            expect(!!(test_board.game_board)).to eq(true)
        end
        it "sets the empty game board" do
            expect(test_board.game_board).to eq(tic_tac_toe_string)
        end
        it "prints the board" do
            expect{test_board.display_board}.to output(tic_tac_toe_string.join).to_stdout
        end
    end
end

