require_relative '../../lib/interface'

describe Interface do
    context 'when the system asks for input' do
        it 'takes player input' do
          #Arrange
          input = ["hello", "", "start"]
          #Act
          input.each do |string|
            allow(Interface).to receive(:gets).and_return(string)
            #Assert
            expect(Interface.receive_player_input).to eq(string)
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
          expect{Interface.print_message(string)}.to output(string).to_stdout
        end
      end
    end

    context 'when the controller needs to display the board' do
        it 'outputs the board to the terminal' do
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
            expect{Interface.display_board(board_state)}.to output(tic_tac_toe_string).to_stdout
        end
      end
end