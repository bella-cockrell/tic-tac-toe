require_relative '../../lib/input_translator'

describe InputTranslator do
    context 'when player adds their input' do

        input = {
            "a 1" => [0, 0],
            "a 2" => [1, 0],
            # "B 2" => true,
            # "A 5" => false,
            # "3 C" => true,
            # "3, C" => true,
            # "3-C" => true,
            # "C" => false,
            # "3" => false
        }




        it 'outputs input as coords for the game state' do
            input = 'a 1'
            expect(described_class.new.translate(input)).to eq([0, 0])
        end
        it 'outputs different input as coords for the game state' do
            input = 'a 2'
            expect(described_class.new.translate(input)).to eq([1, 0])
        end
    end

    context 'standardizes input from player for the translator' do
        player_input = {
            "A 1" => 'A1',
            "B 2" => 'B2',
            "C  1" => "C1",
            "A-1" => "A1",
            "3 C" => 'C3',
            "3, C" => 'C3',
            "3-C" => 'C3'
        }
        it 'returns standard output' do
            player_input.each do |input, output|
                expect(described_class.new.standardize(input)).to eq(output)
            end
        end
    end
end