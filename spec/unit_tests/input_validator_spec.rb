require_relative '../../input_validator'

describe InputValidator do
    context 'when player gives input after welcome message' do
        it 'returns true if input is valid' do
            validator = InputValidator.new
            expect(validator.first_input("START")).to eq(true)
        end
    end
end