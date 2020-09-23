require_relative '../game'

describe Game do
    game = Game.new
    context "when player loads program" do
        it "initializes the game object" do
            expect(!!(game)).to eq(true)
        end
        it "outputs a prompt" do
            expect(game.welcome_message).to eq("Welcome to the game, type 'start' to begin.")
        end
        it "takes a player's input and checks that its start" do
            #Arrange
            
            #Act/Assert
            game.start_game
            expect(game.start_input).to eq("Start")
        end
    end
end