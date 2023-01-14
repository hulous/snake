module Snake
  class Food
    attr_reader :x, :y

    def initialize
      @x = rand(Config::GRID_WIDTH)
      @y = rand(Config::GRID_HEIGHT)
    end

    def draw
      Ruby2D::Square.new(x: x * Config::GRID_SIZE, y: y * Config::GRID_SIZE, size: Config::GRID_SIZE - 1, color: 'yellow')
    end

    def eaten?(snake_head)
      x.eql?(snake_head.first) && y.eql?(snake_head.last)
    end
  end
end
