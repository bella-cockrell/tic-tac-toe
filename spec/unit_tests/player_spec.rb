require_relative '../../player'

describe Player do
    context 'when the system asks for input' do
        it 'takes player input' do
          #Arrange
          player = Player.new
          #Act
          input = ["hello", "", "start"]
          input.each do |string|
            allow(player).to receive(:gets).and_return(string)
            #Assert
            expect(player.receive_input).to eq(string)
          end
        end
    end
end