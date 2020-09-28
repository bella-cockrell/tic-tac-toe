require_relative '../../input_validator'

describe InputValidator do
    context 'when player gives input after welcome message' do
        it 'returns true if input is valid' do
            validator = InputValidator.new
            expect(validator.first_input("START")).to eq(true)
            expect(validator.first_input("sTaRt")).to eq(true)
        end
        it 'returns false if input is invalid' do
            validator = InputValidator.new
            expect(validator.first_input("bloop")).to eq(false)
        end
    end
end