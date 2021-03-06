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
    context "when player inputs a move" do
        it "updates the game state" do
            test_board = Board.new
            test_board.update_board([0, 0], "x")
            expect(test_board.board_state).to eq([["x", " ", " "], [" ", " ", " "], [" ", " ", " "]])
            
        end
        it "updates the game state with a different move" do
            test_board = Board.new
            test_board.update_board([0, 1], "x")
            expect(test_board.board_state).to eq([[" ", "x", " "], [" ", " ", " "], [" ", " ", " "]])
        end
        it "updated the game with an additional move" do
            test_board = Board.new
            test_board.update_board([0, 1], "x")
            test_board.update_board([0, 2], "o")
            expect(test_board.board_state).to eq([[" ", "x", "o"], [" ", " ", " "], [" ", " ", " "]])
        end
    end
end

