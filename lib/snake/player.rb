module Snake
  class Player
    def initialize
      @score = 0
    end

    def draw
      Ruby2D::Text.new("Score: #{@score}", color: "green", x: 10, y: 10, size: 25)
    end

    def record_eat
      @score += 1
    end
  end
end
