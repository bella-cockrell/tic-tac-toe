require_relative '../../general_messages'

describe GeneralMessages do
    context "when the method is called" do
        it "prints the welcome message to terminal" do
            expect{GeneralMessages.new.welcome_message}.to output("Welcome to the game, type 'start' to begin.\n").to_stdout
        end
    end
end