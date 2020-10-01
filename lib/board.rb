class Board
    attr_accessor :game_board, :board_state
   
    def initialize
        @game_board = [
            "    a     b     c  \n",
            "       |     |     \n",
            "1      |     |     \n",
            "  _____|_____|_____\n",
            "       |     |     \n",
            "2      |     |     \n",
            "  _____|_____|_____\n",
            "       |     |     \n",
            "3      |     |     \n",
            "       |     |     \n"
        ]
        @board_state = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
    end

    def display_board
        puts @game_board.join
    end

    def update_board(coords, player_symbol)
        @board_state[coords[0]
        ][coords[1]] = player_symbol
    end

end