require_relative "../../initialize_game"

describe InitializeGame do
    context "when the game is loaded" do
        it "initializes the game, asks for user input, checks it and prints board" do
        #Act
        initialize_game = InitializeGame.new
        #Assert
        expect(initialize_game.run_setup).to eq(true)
        end
    end
end