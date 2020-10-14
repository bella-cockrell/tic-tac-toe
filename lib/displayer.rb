class Displayer

    def self.receive_player_input
        string = gets.chomp
        return string
    end

    def self.print_message(string)
        puts string
    end

    def self.display_board(board_state)
        tic_tac_toe_string = [
            "    a     b     c  \n",
            "       |     |     \n",
            "1   #{board_state[0][0]}  |  #{board_state[0][1]}  |  #{board_state[0][2]}  \n",
            "  _____|_____|_____\n",
            "       |     |     \n",
            "2   #{board_state[1][0]}  |  #{board_state[1][1]}  |  #{board_state[1][2]}  \n",
            "  _____|_____|_____\n",
            "       |     |     \n",
            "3   #{board_state[2][0]}  |  #{board_state[2][1]}  |  #{board_state[2][2]}  \n",
            "       |     |     \n"
            ]
        puts tic_tac_toe_string.join
    end
end