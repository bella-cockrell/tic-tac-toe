require_relative "../../lib/ai.rb"



describe AI do
    context "when x is about to win in a row" do

        board_state = {[["x", "x", " "], [" ", " ", " "], [" ", " ", " "]] => [0, 2],
                       [[" ", " ", " "], ["x", "x", " "], [" ", " ", " "]] => [1, 2],
                       [["x", "x", " "], [" ", "o", "o"], [" ", " ", " "]] => [1, 0]
                }

        it "adds an o to block" do
            #arrange
            ai_input = AI.new
            #act/assert
            board_state.each do |board, output|
               expect(ai_input.ai_move(board)).to eq(output) 
            end
            
        end
    end

    context "when the ai checks the value of a row move" do
        it "assigns infinity if its a winning move" do
            ai_input = AI.new
            board_state = [["x", "x", " "], ["o", "o", " "], [" ", " ", " "]]
            processsed_value = ai_input.move_value_calculator(board_state, [1, 2])
            expect(processsed_value).to eq(Float::INFINITY)
        end
        it "assigns 1 if [0, 2] is a blocking move to the top right" do
            ai_input = AI.new
            board_state = [["x", "x", " "], ["o", " ", " "], [" ", " ", " "]]
            processsed_value = ai_input.move_value_calculator(board_state, [0, 2])
            expect(processsed_value).to eq(1)
        end
        it "assigns 1 if [1,2] is a blocking move to the middle right" do
            ai_input = AI.new
            board_state = [[" ", " ", " "], ["x", "x", " "], [" ", " ", " "]]
            processsed_value = ai_input.move_value_calculator(board_state, [1, 2])
            expect(processsed_value).to eq(1)
        end
        it "assigns 1 if [1,1] is a blocking move in the middle" do
            ai_input = AI.new
            board_state = [[" ", " ", " "], ["x", " ", "x"], [" ", " ", " "]]
            processsed_value = ai_input.move_value_calculator(board_state, [1, 1])
            expect(processsed_value).to eq(1)
        end
        it "assigns 1 if [1,0] is a blocking move to the top left" do
            ai_input = AI.new
            board_state = [[" ", " ", " "], [" ", "x", "x"], [" ", " ", " "]]
            processsed_value = ai_input.move_value_calculator(board_state, [1, 0])
            expect(processsed_value).to eq(1)
        end
        it "assigns 1 if [2,0] is a blocking move to the bottom left" do
            ai_input = AI.new
            board_state = [[" ", " ", " "], [" ", " ", " "], [" ", "x", "x"]]
            processsed_value = ai_input.move_value_calculator(board_state, [2, 0])
            expect(processsed_value).to eq(1)
        end
    end
    context "when the ai checks the value of a column move" do
        it "assigns 1 if [2,0] is a blocking move to the bottom left" do
            ai_input = AI.new
            board_state = [["x", " ", " "], ["x", " ", " "], [" ", " ", " "]]
            processsed_value = ai_input.move_value_calculator(board_state, [2, 0])
            expect(processsed_value).to eq(1)
        end
        it "assigns 1 if [1,1] is a blocking move to the middle" do
            ai_input = AI.new
            board_state = [[" ", "x", " "], [" ", " ", " "], [" ", "x", " "]]
            processsed_value = ai_input.move_value_calculator(board_state, [1, 1])
            expect(processsed_value).to eq(1)
        end
    end
    context "when the ai checks the value of a diagonal move" do
        it "assigns 1 if [2, 2] is a blocking move to the bottom right" do
            ai_input = AI.new
            board_state = [["x", " ", " "], [" ", "x", " "], [" ", " ", " "]]
            processsed_value = ai_input.move_value_calculator(board_state, [2, 2])
            expect(processsed_value).to eq(1)
        end
        it "assigns 1 if [1,1] is a blocking move to the middle" do
            ai_input = AI.new
            board_state = [["x", " ", " "], [" ", " ", " "], [" ", " ", "x"]]
            processsed_value = ai_input.move_value_calculator(board_state, [1, 1])
            expect(processsed_value).to eq(1)
        end
        it "assigns Infinity [2,0] it ISNT a blocking move but still on a diag" do
            ai_input = AI.new
            board_state = [[" ", "x", " "], [" ", " ", "x"], [" ", " ", " "]]
            processsed_value = ai_input.move_value_calculator(board_state, [2, 0])
            expect(processsed_value).to eq(0)
        end
        it "assigns 1 if [2,0] is a blocking move to the bottom left" do
            ai_input = AI.new
            board_state = [[" ", " ", "x"], [" ", "x", " "], [" ", " ", " "]]
            processsed_value = ai_input.move_value_calculator(board_state, [2, 0])
            expect(processsed_value).to eq(1)
        end
        it "assigns 1 if [1,1] is a blocking move to the bottom left" do
            ai_input = AI.new
            board_state = [[" ", " ", "x"], [" ", " ", " "], ["x", " ", " "]]
            processsed_value = ai_input.move_value_calculator(board_state, [1,1])
            expect(processsed_value).to eq(1)
        end
    end
    context "when the AI checks the value of a winning move" do
        it "returns Infinity on a row" do
            ai_input = AI.new
            board_state = [["o", "o", " "], [" ", " ", " "], [" ", " ", " "]]
            processsed_value = ai_input.move_value_calculator(board_state, [0,2])
            expect(processsed_value).to eq(Float::INFINITY) 
        end
        it "returns Infinity on a backwards diag" do
            ai_input = AI.new
            board_state = [[" ", " ", "o"], [" ", "o", " "], [" ", " ", " "]]
            processsed_value = ai_input.move_value_calculator(board_state, [2,0])
            expect(processsed_value).to eq(Float::INFINITY) 
        end
        it "returns Infinity on a column" do
            ai_input = AI.new
            board_state = [[" ", "o", " "], [" ", "o", " "], [" ", " ", " "]]
            processsed_value = ai_input.move_value_calculator(board_state, [2,1])
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