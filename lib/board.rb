class Board
    attr_accessor :board_state
   
    def initialize
        @board_state = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
    end

    def update_board(coords, player_symbol)
        @board_state[coords[0]][coords[1]] = player_symbol
    end

    def reset
        @board_state = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
    end
end