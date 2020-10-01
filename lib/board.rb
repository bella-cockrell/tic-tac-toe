class Board
    attr_accessor :game_board
   
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
    end

    def display_board
        puts @game_board.join
    end

end