class InputChecker
    def self.check(coord, board_state)
        if board_state[coord[0]][coord[1]] == " "
            return true
        else
            return false
        end
    end
end

#input checker test