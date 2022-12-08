module Snake
  class Snake
    attr_writer :direction

    def initialize
      @positions = [
        [2, 0],
        [2, 1],
        [2, 2],
        [2, 3],
      ]

      @direction = 'down'
    end

    def draw
      @positions.each do |position|
        draw_square(x: position[0] * Game::GRID_SIZE, y: position[1] * Game::GRID_SIZE, color: 'white')
      end
    end

    private def draw_square(x:, y:, color:)
      Square.new(x: x, y: y, size: Game::GRID_SIZE - 1, color: color)
    end

    def move
      @positions.shift

      case @direction
      when 'down'
        @positions.push([head[0], head[1] + 1])
      when 'up'
        @positions.push([head[0], head[1] - 1])
      when 'left'
        @positions.push([head[0] - 1, head[1]])
      when 'right'
        @positions.push([head[0] + 1, head[1]])
      end
    end

    private def head
      @positions.last
    end
  end
end
