require_relative '../../lib/input_validator'

describe InputValidator do
    context 'when player gives input after welcome message' do
        it 'returns true if input is valid' do
            expect(InputValidator.first_input("START")).to eq(true)
            expect(InputValidator.first_input("sTaRt")).to eq(true)
        end
        it 'returns false if input is invalid' do
            expect(InputValidator.first_input("bloop")).to eq(false)
        end
    end
    context "when the player inputs a move" do

        player_input = {
            "A 1" => true,
            "top left" => false,
            "B 2" => true,
            "A 5" => false,
            "3 C" => true,
            "3, C" => true,
            "3-C" => true,
            "C" => false,
            "3" => false
        }

        it "checks that the input is valid" do
            player_input.each do |key, value|
                expect(InputValidator.player_move_input(key)).to eq(value)
            end
        end
    end
end