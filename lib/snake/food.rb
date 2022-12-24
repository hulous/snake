module Snake
  class Food
    attr_reader :x, :y

    def initialize
      @x = rand(Game::GRID_WIDTH)
      @y = rand(Game::GRID_HEIGHT)
    end

    def draw
      draw_square(
        x_value: x * Game::GRID_SIZE,
        y_value: y * Game::GRID_SIZE,
        color: 'yellow'
      )
    end

    def eaten?(snake_head)
      x.eql?(snake_head.first) && y.eql?(snake_head.last)
    end

    private

    def draw_square(x_value:, y_value:, color:)
      Square.new(
        x: x_value,
        y: y_value,
        size: Game::GRID_SIZE - 1,
        color: color
      )
    end
  end
end
