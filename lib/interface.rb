class Interface

    def self.receive_player_input
        string = gets.chomp
        return string
    end

    def self.print_message(string)
        puts string
    end

    #display board
    def self.display_board(board_state)
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
        puts tic_tac_toe_string.join
    end

end