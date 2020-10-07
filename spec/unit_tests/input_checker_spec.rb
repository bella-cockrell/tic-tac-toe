require_relative '../../lib/input_checker'

describe InputChecker do
    context "when given a non-repeated value" do
        it "returns true" do
            coord = [0,0]
            board_state = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
            expect(described_class.check(coord, board_state)).to eq(true)
        end
        it "returns true" do
            coord = [0,1]
            board_state = [["x", " ", "x"], [" ", " ", " "], [" ", " ", " "]]
            expect(described_class.check(coord, board_state)).to eq(true)
        end
    end
    context "when given a repeated value" do
        it "returns false" do
            coord = [0,0]
            board_state = [["x", " ", " "], [" ", " ", " "], [" ", " ", " "]]
            expect(described_class.check(coord, board_state)).to eq(false)
        end
        it "returns false" do
            coord = [1,1]
            board_state = [["x", " ", " "], [" ", "x", " "], [" ", " ", " "]]
            expect(described_class.check(coord, board_state)).to eq(false)
        end
    end
end
#input checker test