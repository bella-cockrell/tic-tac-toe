require_relative '../../lib/input_translator'

describe InputTranslator do
    context 'when player adds their input' do

        player_input = {
            "A1" => [0, 0],
            "B2" => [1, 1],
            "C1" => [0,2],
            "A1" => [0,0],
            "C3" => [2,2]
        }

        it 'outputs input as coords for the game state' do
            player_input.each do |input, output|
                expect(described_class.convert(input)).to eq(output)
            end
            
        end
    end

    context 'standardizes input from player for the translator' do
        player_input = {
            "A 1" => 'A1',
            "B 2" => 'B2',
            "C  1" => "C1",
            "a 1" => 'A1',
            "A-1" => "A1",
            "3 C" => 'C3',
            "3, C" => 'C3',
            "3-C" => 'C3'
        }
        it 'returns standard output' do
            player_input.each do |input, output|
                expect(described_class.standardize(input)).to eq(output)
            end
        end
    end
end