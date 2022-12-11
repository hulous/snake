module Snake
  class Food
    def initialize; end

    def draw
      draw_square(
        x_value: x * Game::GRID_SIZE,
        y_value: y * Game::GRID_SIZE,
        color: 'yellow'
      )
    end

    def eaten(snake_head_x, snake_head_y)
      x.eql?(snake_head_x) && y.eql?(snake_head_y)
    end

    private

    def x
      @x ||= rand(Game::GRID_WIDTH)
    end

    def y
      @y ||= rand(Game::GRID_HEIGHT)
    end

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
