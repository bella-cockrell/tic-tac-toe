require_relative "../../lib/ai.rb"

describe AI do
    context "when x is about to win in a row" do
        child_board = {[["x", " ", " "], [" ", " ", " "], [" ", " ", " "]] => [1, 1],
                       [[" ", " ", " "], [" ", " ", " "], [" ", " ", "x"]] => [1, 1],
                       [["x", "o", "x"], [" ", "o", " "], ["o", "x", "x"]] => [1, 2]
                }
        it "adds an o to block" do
            #arrange
            ai_input = AI.new
            #act/assert
            child_board.each do |board, output|
               expect(ai_input.ai_move(board)).to eq(output) 
            end
        end
    end

    context "when the ai checks the value of a row move" do
        it "assigns one if its a winning move" do
            ai_input = AI.new
            child_board = [["x", "x", " "], ["o", "o", "o"], [" ", " ", " "]]
            processsed_value = ai_input.move_value_calculator(child_board, [1, 2])
            expect(processsed_value).to eq(1)
        end
        it "assigns 1 if [0, 2] is a blocking move to the top right" do
            ai_input = AI.new
            child_board = [["x", "x", "o"], ["o", " ", " "], [" ", " ", " "]]
            processsed_value = ai_input.move_value_calculator(child_board, [0, 2])
            expect(processsed_value).to eq(nil)
        end
        it "assigns 1 if [1,2] is a blocking move to the middle right" do
            ai_input = AI.new
            child_board = [[" ", " ", " "], ["x", "x", "o"], [" ", " ", " "]]
            processsed_value = ai_input.move_value_calculator(child_board, [1, 2])
            expect(processsed_value).to eq(nil)
        end
        it "assigns 1 if [1,1] is a blocking move in the middle" do
            ai_input = AI.new
            child_board = [[" ", " ", " "], ["x", "o", "x"], [" ", " ", " "]]
            processsed_value = ai_input.move_value_calculator(child_board, [1, 1])
            expect(processsed_value).to eq(nil)
        end
        it "assigns 1 if [1,0] is a blocking move to the top left" do
            ai_input = AI.new
            child_board = [[" ", " ", " "], ["o", "x", "x"], [" ", " ", " "]]
            processsed_value = ai_input.move_value_calculator(child_board, [1, 0])
            expect(processsed_value).to eq(nil)
        end
        it "assigns 1 if [2,0] is a blocking move to the bottom left" do
            ai_input = AI.new
            child_board = [[" ", " ", " "], [" ", " ", " "], ["o", "x", "x"]]
            processsed_value = ai_input.move_value_calculator(child_board, [2, 0])
            expect(processsed_value).to eq(nil)
        end
    end
    context "when the ai checks the value of a column move" do
        it "assigns 1 if [2,0] is a blocking move to the bottom left" do
            ai_input = AI.new
            child_board = [["x", " ", " "], ["x", " ", " "], ["o", " ", " "]]
            processsed_value = ai_input.move_value_calculator(child_board, [2, 0])
            expect(processsed_value).to eq(nil)
        end
        it "assigns 1 if [1,1] is a blocking move to the middle" do
            ai_input = AI.new
            child_board = [[" ", "x", " "], [" ", "o", " "], [" ", "x", " "]]
            processsed_value = ai_input.move_value_calculator(child_board, [1, 1])
            expect(processsed_value).to eq(nil)
        end
    end
    context "when the ai checks the value of a diagonal move" do
        it "assigns 1 if [2, 2] is a blocking move to the bottom right" do
            ai_input = AI.new
            child_board = [["x", " ", " "], [" ", "x", " "], [" ", " ", "o"]]
            processsed_value = ai_input.move_value_calculator(child_board, [2, 2])
            expect(processsed_value).to eq(nil)
        end
        it "assigns 1 if [1,1] is a blocking move to the middle" do
            ai_input = AI.new
            child_board = [["x", " ", " "], [" ", "o", " "], [" ", " ", "x"]]
            processsed_value = ai_input.move_value_calculator(child_board, [1, 1])
            expect(processsed_value).to eq(nil)
        end
        it "assigns one [2,0] it ISNT a blocking move but still on a diag" do
            ai_input = AI.new
            child_board = [[" ", "x", " "], [" ", " ", "x"], ["o", " ", " "]]
            processsed_value = ai_input.move_value_calculator(child_board, [2, 0])
            expect(processsed_value).to eq(nil)
        end
        it "assigns 1 if [2,0] is a blocking move to the bottom left" do
            ai_input = AI.new
            child_board = [[" ", " ", "x"], [" ", "x", " "], ["o", " ", " "]]
            processsed_value = ai_input.move_value_calculator(child_board, [2, 0])
            expect(processsed_value).to eq(nil)
        end
        it "assigns 1 if [1,1] is a blocking move to the bottom left" do
            ai_input = AI.new
            child_board = [[" ", " ", "x"], [" ", "o", " "], ["x", " ", " "]]
            processsed_value = ai_input.move_value_calculator(child_board, [1,1])
            expect(processsed_value).to eq(nil)
        end
    end
    context "when the AI checks the value of a winning move" do
        it "returns one on a row" do
            ai_input = AI.new
            child_board = [["o", "o", "o"], [" ", " ", " "], [" ", " ", " "]]
            processsed_value = ai_input.move_value_calculator(child_board, [0,2])
            expect(processsed_value).to eq(1) 
        end
        it "returns one on a backwards diag" do
            ai_input = AI.new
            child_board = [[" ", " ", "o"], [" ", "o", " "], ["o", " ", " "]]
            processsed_value = ai_input.move_value_calculator(child_board, [2,0])
            expect(processsed_value).to eq(1) 
        end
        it "returns one on a column" do
            ai_input = AI.new
            child_board = [[" ", "o", " "], [" ", "o", " "], [" ", "o", " "]]
            processsed_value = ai_input.move_value_calculator(child_board, [2,1])
            expect(processsed_value).to eq(1) 
        end
    end
    context "when the AI checks the value of a losing move" do
        it "returns -1" do
            ai_input = AI.new
            child_board = [["x", "x", "x"], [" ", " ", " "], [" ", " ", " "]]
            processsed_value = ai_input.move_value_calculator(child_board, [0,2])
            expect(processsed_value).to eq(-1) 
        end
    end
end