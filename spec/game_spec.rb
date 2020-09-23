require_relative "../game"

describe Game do
    game = Game.new
    context "when player loads program" do
        it "initializes the game object" do
            expect(!!(game)).to eq(true)
        end
    end
end