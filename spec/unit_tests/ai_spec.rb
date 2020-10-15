require_relative "../../lib/ai.rb"



describe AI do
    xcontext "when x is about to win in a row" do

        board_state = {[["x", "x", " "], [" ", " ", " "], [" ", " ", " "]] => [0, 2],
                       [[" ", " ", " "], ["x", "x", " "], [" ", " ", " "]] => [1, 2]}

        it "adds an o to block" do
            #arrange
            ai_input = AI.new
            #act/assert
            board_state.each do |board, output|
               expect(ai_input.ai_move(board)).to eq(output) 
            end
            
        end
    end

    context "when the ai loops through all available moves" do
        it "assigns infinity if its a winning move" do
            ai_input = AI.new
            board_state = [["x", "x", " "], ["o", "o", " "], [" ", " ", " "]]
            processsed_value = ai_input.move_value_calculator(board_state, [0, 2])
            expect(processsed_value).to eq(Float::INFINITY)
        end
    end
        
    # context "first move: when the middle square is NOT free" do
    #     it "adds an o in the corner" do
    #         #arrange
    #         ai_input = AI.new
    #         board_state = [[" ", " ", " "], [" ", "x", " "], [" ", " ", " "]]
    #         #act/assert
    #         expect(ai_input.ai_move(board_state)).to eq([1, 1])
    #     end
    # end
end