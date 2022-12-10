module Snake
  class Food
    attr_writer :direction

    def initialize
      @x = rand(Game::GRID_WIDTH)
      @y = rand(Game::GRID_HEIGHT)
    end

    def draw
      draw_square(x: @x * Game::GRID_SIZE, y: @y * Game::GRID_SIZE, color: 'yellow')
    end

    private def draw_square(x:, y:, color:)
      Square.new(x: x, y: y, size: Game::GRID_SIZE - 1, color: color)
    end
  end
end
