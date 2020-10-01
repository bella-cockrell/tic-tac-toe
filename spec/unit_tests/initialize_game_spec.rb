require_relative "../../lib/initialize_game"
require_relative "../../lib/player"
require_relative "../../lib/input_validator"

describe InitializeGame do
    context "when the game is loaded" do
        it "initializes the game, asks for user input, checks it and prints board" do
            #Act
            initialize_game = InitializeGame.new
            # player_input = "start"
            # receive_input = double()
            # allow(InputValidator.new.first_input).to receive(player_input).and_return(true)
            
            #Assert
            expect(initialize_game.run_setup).to eq(true)
        end
    end
end

# describe Payment do
#     it 'records the payment' do
#       payment_gateway = double()
#       allow(payment_gateway).to receive(:charge).and_return(payment_id: 1234)
  
#       logger = Logger.new
  
#       payment = Payment.new(payment_gateway, logger)
#       payment.total_cents = 1800
#       payment.save
#     end
#   end