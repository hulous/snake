module Snake
  class Player
    def initialize
      @score = 0
      @lose = false
    end

    def draw
      Ruby2D::Text.new(score_message, color: "green", x: 10, y: 10, size: 25)
      Ruby2D::Text.new(game_over_message, color: "green", x: 10, y: 50, size: 25) if lose?
    end

    def record_eat
      @score += 1
    end

    def lose?
      @lose
    end

    def lose
      @lose = true
    end

    private

    def score_message
      "Score: #{@score}"
    end

    def game_over_message
      "Game Over! Press 'r' to restart. Press 'q' to quit."
    end
  end
end
