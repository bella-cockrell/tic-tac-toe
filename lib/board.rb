class Board
    attr_accessor :game_board, :board_state
   
    def initialize
        @board_state = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
    end

    def update_board(coords, player_symbol)
        @board_state[coords[0]][coords[1]] = player_symbol
    end

end