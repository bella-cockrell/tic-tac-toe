class CheckForWin

    def self.check_for_loss(board_state)
        if check_rows(board_state)
            return "loss"
        elsif check_columns(board_state)
            return "loss"
        elsif check_diagonals(board_state)
            return "loss"
        else
            return "ongoing"
        end
        
    end

    def self.check_rows(board_state)
        for i in 0..2
            if board_state[i][0] ==  board_state[i][1] && board_state[i][0] == board_state[i][2] && board_state[i][0] != " "
                return true
            end   
        end
        false
    end

    def self.check_columns(board_state)
        for i in 0..2
            if board_state[0][i] ==  board_state[1][i] && board_state[0][i] ==  board_state[2][i] && board_state[0][i] != " "
                return true
            end
        end
        false
    end

    def self.check_diagonals(board_state)
        if board_state[0][0] ==  board_state[1][1] && board_state[0][0] ==  board_state[2][2] && board_state[0][0] != " "
            return true
        end
        if board_state[0][2] ==  board_state[1][1] && board_state[0][2] ==  board_state[2][0] && board_state[0][2] != " "
            return true
        end
        false
    end

end