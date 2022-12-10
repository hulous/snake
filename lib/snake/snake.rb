module Snake
  class Snake
    attr_writer :direction

    def initialize
      @positions = [ [2, 0], [2, 1], [2, 2], [2, 3] ]
      @direction = 'down'
    end

    def draw
      @positions.each do |position|
        draw_square(x: position[0] * Game::GRID_SIZE, y: position[1] * Game::GRID_SIZE, color: 'white')
      end
    end

    def move
      @positions.shift

      case @direction
        when 'down'
          @positions.push(new_coords(x: head[0], y: head[1] + 1))
        when 'up'
          @positions.push(new_coords(x: head[0], y: head[1] - 1))
        when 'left'
          @positions.push(new_coords(x: head[0] - 1, y: head[1]))
        when 'right'
          @positions.push(new_coords(x: head[0] + 1, y: head[1]))
      end
    end

    def can_change_direction_to?(new_direction)
      case @direction
        when 'up' then new_direction != 'down'
        when 'down' then new_direction != 'up'
        when 'left' then new_direction != 'right'
        when 'right' then new_direction != 'left'
      end
    end

    def head_x
      head.first
    end

    def head_y
      head.last
    end

    private

    def draw_square(x:, y:, color:)
      Ruby2D::Square.new(x: x, y: y, size: Game::GRID_SIZE - 1, color: color)
    end

    def new_coords(x:, y:)
      [x % Game::GRID_WIDTH, y % Game::GRID_HEIGHT]
    end

    def head
      @positions.last
    end
  end
end
