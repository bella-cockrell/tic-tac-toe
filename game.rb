require_relative './board'

class Game
    attr_accessor :start_input

    def initialize
        @start_input = ""
    end

    def start_game 
        self.welcome_message
        self.get_init_input
    end


# game = Game.new
# game.start_game




    def welcome_message
        puts "Welcome to the game, type 'start' to begin."
    end

    def get_init_input_and_compare
        start_input = gets.chomp.upcase
        if start_input == "START"
            return "START"
        else
            puts "Try again."
            get_init_input_and_compare
        end
    end



end