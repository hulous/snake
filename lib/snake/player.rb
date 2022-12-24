module Snake
  class Player
    def initialize
      @score = 0
      @lose = false
    end

    def draw
      return game_over_message if self.lose?

      score_message
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
      render_text("Score: #{@score}")
    end

    def game_over_message
      render_text("Score: #{@score}. Game Over! Press 'r' to restart. Press 'q' to quit.")
    end

    def render_text(message)
      Ruby2D::Text.new(message, color: "green", x: 10, y: 10, size: 25)
    end
  end
end
