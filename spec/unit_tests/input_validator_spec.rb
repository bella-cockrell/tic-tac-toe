require_relative '../../input_validator'

describe InputValidator do
    context 'when player gives input after welcome message' do
        it 'returns true if input is valid' do
            validator = InputValidator.new
            expect(validator.first_input("START")).to eq(true)
            expect(validator.first_input("sTaRt")).to eq(true)
        end
        it 'returns false if input is invalid' do
            validator = InputValidator.new
            expect(validator.first_input("bloop")).to eq(false)
        end
    end
    context "when the player inputs a move" do
        it "checks that the input is valid" do
            validator = InputValidator.new
            expect(validator.player_move_input("A 1")).to eq(true)
            expect(validator.player_move_input("top left")).to eq(false)
            expect(validator.player_move_input("B 2")).to eq(true)
            # expect(validator.player_move_input("A 5")).to eq(false)
        end
    end
end