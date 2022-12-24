module Snake
  class Food
    attr_reader :x, :y

    def initialize
      @x = rand(Game::GRID_WIDTH)
      @y = rand(Game::GRID_HEIGHT)
    end

    def draw
      Square.new(
        x: x * Game::GRID_SIZE,
        y: y * Game::GRID_SIZE,
        size: Game::GRID_SIZE - 1,
        color: 'yellow'
      )
    end

    def eaten?(snake_head)
      x.eql?(snake_head.first) && y.eql?(snake_head.last)
    end
  end
end
