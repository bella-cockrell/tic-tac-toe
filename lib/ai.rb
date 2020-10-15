class AI

    def ai_move(board_state)
        # avail_moves = find avail_moves
        # for each move in avail_moves{
        #     move_value_calculator(board_state, move)
        #     if value > storedmove

        #     end
        # }
        # pick move
    end

    def move_value_calculator(board_state, move)
        Float::INFINITY
     #compares move to board_state
    end

    #def available_move_looper(board_state)
    #returns empty slots and then feeds it into ai_move

    
end

# easy AI -- look at available moves one level down
#     [["x", "x", " "], ["o", "o", "+o"], [" ", " ", " "]] => Float::INFINITY
#     [["x", "x", "+o"], [" ", " ", " "], [" ", " ", " "]] => 1
#     [["x", "x", " "], ["+o", " ", " "], [" ", " ", " "]] => 0

# medium AI -- look at available moves two levels down

# hard AI -- look at available moves all levels down