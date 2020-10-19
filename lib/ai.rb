class AI

    def ai_move(board_state)
        value = -1
        for i in 0..2
            for j in 0..2
                if board_state[i][j] == " "
                    if move_value_calculator(board_state, [i,j]) > value
                        value = move_value_calculator(board_state, [i,j])
                        stored_move = [i,j]
                    end
                end
            end
        end
        return stored_move
    end

    def move_value_calculator(board_state, move)
        if check_row_blocker?(board_state, move, "x") || check_column_blocker?(board_state, move, "x") || check_diagonal_blocker?(board_state, move, "x")
            return 1
        elsif check_row_blocker?(board_state, move, "o") || check_column_blocker?(board_state, move, "o") || check_diagonal_blocker?(board_state, move, "o")
            Float::INFINITY
        else
            return 0
        end
    end

    private
    def check_row_blocker?(board_state, move, symbol)
        board_state[move[0]][move[1] - 1] == board_state[move[0]][move[1] - 2] && board_state[move[0]][move[1] - 2] == symbol
    end
    
    def check_column_blocker?(board_state, move, symbol)
        board_state[move[0] - 1][move[1]] == board_state[move[0] - 2][move[1]] && board_state[move[0] - 2][move[1]] == symbol
    end

    def check_diagonal_blocker?(board_state, move, symbol)
        state = false
        if move[0] == move[1]
            state = board_state[move[0] - 1][move[1] - 1] == board_state[move[0] - 2][move[1] - 2] && board_state[move[0] - 2][move[1] - 2] == symbol
        end
        if state
            return state
        end
        if move[0] + move[1] == 2
            state = board_state[move[0] - 1][(move[1] + 1)%3] == board_state[move[0] - 2][(move[1] + 2)%3] && board_state[move[0] - 2][(move[1] + 2)%3] == symbol
        end
        return state
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