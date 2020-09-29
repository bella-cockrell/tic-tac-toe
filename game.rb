require_relative './initialize_game'

class Game
    def main
        InitializeGame.new.run_setup
        # GameLoop.new
            # => PlayerMove.new
            # => Check.new
            # => AIMove.new
    end
end
