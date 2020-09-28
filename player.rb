class Player

    def receive_input
        string = gets.chomp
        if string.length == 0
            return ""
        else
            return "hello"
        end
    end
end