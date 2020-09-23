class Game
    attr_accessor :welcome_message, :start_input

    def initialize
        @welcome_message = "Welcome to the game, type 'start' to begin."
        @start_input = ""
    end

    def start_game
        puts @welcome_message
        @start_input = gets.chomp
    end

end

# game = Game.new
# game.start_game
