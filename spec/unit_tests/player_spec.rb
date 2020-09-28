require_relative '../../player'

describe Player do
    context 'when the system asks for input' do
        it 'takes player input' do
          #Arrange
          player = Player.new
          #Act
          input = "hello"
          allow(player).to receive(:gets).and_return(input)
          #Assert
          expect(player.receive_input).to eq(input)
        end
    end
end