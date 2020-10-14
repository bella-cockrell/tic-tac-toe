require_relative '../../lib/displayer'

describe Displayer do
    context 'when the system asks for input' do
        it 'takes player input' do
          #Arrange
          input = ["hello", "", "start"]
          #Act
          input.each do |string|
            allow(Displayer).to receive(:gets).and_return(string)
            #Assert
            expect(Displayer.receive_player_input).to eq(string)
          end
        end
    end

    context 'when the controller needs to output a message' do
      it 'outputs a message' do
        #Arrange
        input = ["hello\n", "\n", "start\n"]
        #Act
        input.each do |string|
          #Assert
          expect{Displayer.print_message(string)}.to output(string).to_stdout
        end
      end
    end

    context 'when the player has inputed their move and the controller needs to output to the terminal' do
        it 'outputs one "x" in a1' do
          #Arrange
          board_state = [["x", " ", " "], [" ", " ", " "], [" ", " ", " "]]
          tic_tac_toe_string = [
            "    a     b     c  \n",
            "       |     |     \n",
            "1   x  |     |     \n",
            "  _____|_____|_____\n",
            "       |     |     \n",
            "2      |     |     \n",
            "  _____|_____|_____\n",
            "       |     |     \n",
            "3      |     |     \n",
            "       |     |     \n"
            ]
            #Assert
            expect{Displayer.display_board(board_state)}.to output(tic_tac_toe_string.join).to_stdout
        end

        it 'outputs one "x" in b1' do
          #Arrange
          board_state = [[" ", "x", " "], [" ", " ", " "], [" ", " ", " "]]
          tic_tac_toe_string = [
            "    a     b     c  \n",
            "       |     |     \n",
            "1      |  x  |     \n",
            "  _____|_____|_____\n",
            "       |     |     \n",
            "2      |     |     \n",
            "  _____|_____|_____\n",
            "       |     |     \n",
            "3      |     |     \n",
            "       |     |     \n"
            ]
            #Assert
            expect{Displayer.display_board(board_state)}.to output(tic_tac_toe_string.join).to_stdout
        end

        it 'outputs the filled board' do
          #Arrange
          board_state = [["x", "x", "x"], ["x", "o", "o"], ["o", "o", "x"]]
          tic_tac_toe_string = [
            "    a     b     c  \n",
            "       |     |     \n",
            "1   x  |  x  |  x  \n",
            "  _____|_____|_____\n",
            "       |     |     \n",
            "2   x  |  o  |  o  \n",
            "  _____|_____|_____\n",
            "       |     |     \n",
            "3   o  |  o  |  x  \n",
            "       |     |     \n"
            ]
            #Assert
            expect{Displayer.display_board(board_state)}.to output(tic_tac_toe_string.join).to_stdout
        end

      end
end