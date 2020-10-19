class AI

    def ai_move(board_state)
        value = -Float::INFINITY
        for i in 0..2
            for j in 0..2
                if board_state[i][j] == " "
                    child_board = board_state.map(&:clone)
                    child_board[i][j] = "o"
                    new_value = minimax(child_board, false, [i,j]) 
                    if new_value > value
                        value = new_value
                        stored_move = [i,j]
                    end
                end
            end
        end
        thinking_bot
        return stored_move
    end
    
    def minimax(board_state, maximising_player, previous_move)
        if move_value_calculator(board_state, previous_move) != nil
            return move_value_calculator(board_state, previous_move)
        end

        if maximising_player == true
            maxEval = -Float::INFINITY
            for i in 0..2
                for j in 0..2
                    if board_state[i][j] == " "
                        child_board = board_state.map(&:clone)
                        child_board[i][j] = "o"
                        value = minimax(child_board, false, [i,j])
                        maxEval = [maxEval, value].max
                    end
                end
            end
            return maxEval
        end

        if maximising_player == false
            minEval = Float::INFINITY
            for i in 0..2
                for j in 0..2
                    if board_state[i][j] == " "
                        child_board = board_state.map(&:clone)
                        child_board[i][j] = "x"
                        value = minimax(child_board, true, [i,j])
                        minEval = [minEval, value].min
                    end
                end
            end
            return minEval
        end
    end

    def move_value_calculator(board_state, move) #check from both perspectives X and O
        if check_row_blocker?(board_state, move, "x") || check_column_blocker?(board_state, move, "x") || check_diagonal_blocker?(board_state, move, "x")
            return -1
        elsif check_row_blocker?(board_state, move, "o") || check_column_blocker?(board_state, move, "o") || check_diagonal_blocker?(board_state, move, "o")
            return 1
        elsif check_draw(board_state)
            return 0
        else
            return nil #the board is still in play
        end
    end

    private
    def check_row_blocker?(board_state, move, symbol)
        board_state[move[0]][move[1] - 1] == board_state[move[0]][move[1] - 2] \
        && board_state[move[0]][move[1] - 2] == board_state[move[0]][move[1]] \
        && board_state[move[0]][move[1]] == symbol #check that one of these values equal to the same symbol
    end
    
    def check_column_blocker?(board_state, move, symbol)
        board_state[move[0] - 1][move[1]] == board_state[move[0] - 2][move[1]] \
        && board_state[move[0] - 2][move[1]] == board_state[move[0]][move[1]] \
        && board_state[move[0]][move[1]] == symbol
    end

    def check_diagonal_blocker?(board_state, move, symbol)
        state = false
        if move[0] == move[1]
            state = board_state[move[0] - 1][move[1] - 1] == board_state[move[0] - 2][move[1] - 2] \
            && board_state[move[0] - 2][move[1] - 2] == board_state[move[0]][move[1]] \
            && board_state[move[0]][move[1]] == symbol
        end
        if state
            return state
        end
        if move[0] + move[1] == 2
            state = board_state[move[0] - 1][(move[1] + 1)%3] == board_state[move[0] - 2][(move[1] + 2)%3] \
            && board_state[move[0] - 2][(move[1] + 2)%3] == board_state[move[0]][move[1]] \
            && board_state[move[0]][move[1]] == symbol
        end
        return state
    end

    def check_draw(board_state)
        for i in 0..2
            for j in 0..2
                if board_state[i][j] == " "
                    return false
                end
            end
        end
        return true
    end

    def thinking_bot
        puts "I AM THINKING"
        sleep 1
    end
end