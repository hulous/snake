module Snake
  class Player
    def initialize
      @score = 0
      @lose = false
    end

    def draw
      Ruby2D::Text.new(score_message, color: "green", x: 10, y: 10, size: 25)
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
      return "Game Over. Score: #{@score}." if lose?

      "Score: #{@score}"
    end
  end
end
