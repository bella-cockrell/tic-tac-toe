require_relative '../../lib/general_messages'

describe GeneralMessages do
    context "when the method is called" do
        it "prints the welcome message to terminal" do
            expect{GeneralMessages.new.welcome_message}.to output("Welcome to the game, type 'start' to begin.\n").to_stdout
        end
        it "prints the invalid input message to terminal" do
            expect{GeneralMessages.new.invalid_input_message}.to output("Invalid input, try again.\n").to_stdout
        end
    end
end