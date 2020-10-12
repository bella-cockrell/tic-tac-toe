require_relative "../../lib/check_for_endgame"

describe CheckForEndGame do
    context "when the board has a row of o's (the AI wins)" do
        it "returns the string 'loss'" do
            board_state = [["o", "o", "o"], ["x", "x", " "], ["x", " ", " "]]
            expect(described_class.check_for_loss(board_state)).to eq("loss")
        end
        it "returns the string 'loss'" do
            board_state = [[" ", "x", "x"], ["o", "o", "o"], ["x", " ", " "]]
            expect(described_class.check_for_loss(board_state)).to eq("loss")
        end
    end
    context "when the board is NOT at a loss state (i.e. ongoing state)" do
        it "returns the string 'ongoing'" do
            board_state = [["o", " ", "o"], ["x", "x", " "], ["x", " ", "o"]]
            expect(described_class.check_for_loss(board_state)).to eq("ongoing")
        end
    end
    context "when the board has a column of o's (the AI wins)" do
        it "returns the string loss" do
            board_state = [["o", "x", " "], ["o", "x", " "], ["o", " ", "x"]]
            expect(described_class.check_for_loss(board_state)).to eq("loss")
        end
    end
    context "when the board has a diagonal of Os (the AI wins)" do
        it "returns the string loss" do
            board_state = [["o", "x", " "], ["x", "o", " "], ["x", " ", "o"]]
            expect(described_class.check_for_loss(board_state)).to eq("loss")
        end
    end
    context "when the board is full and theres no winner" do
        it "returns the string draw" do
            board_state = [["x", "o", "o"], ["o", "x", "x"], ["x", "x", "o"]]
            expect(described_class.check_for_loss(board_state)).to eq("draw")
        end
    end
end

