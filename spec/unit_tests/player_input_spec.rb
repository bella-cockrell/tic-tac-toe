require_relative "../../lib/player_input"

describe PlayerInput do
    context 'when the system asks for input' do
        it 'takes player input' do
          #Arrange
          input = ["hello", "", "start"]
          player_input = PlayerInput.new
          #Act
          input.each do |string|
            allow(player_input).to receive(:gets).and_return(string)
            #Assert
            expect(player_input.receive_player_input).to eq(string)
          end
        end
    end
end
