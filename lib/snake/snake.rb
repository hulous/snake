module Snake
  class Snake
    attr_writer :direction

    def initialize
      @positions = [ [2, 0], [2, 1], [2, 2], [2, 3] ]
      @direction = 'down'
    end

    def draw
      @positions.each do |position|
        draw_square(
          x: position[0] * Config::GRID_SIZE,
          y: position[1] * Config::GRID_SIZE
        )
      end
    end

    def grow
      push_new_position
    end

    def move
      @positions.shift
      push_new_position
    end

    def can_change_direction_to?(new_direction)
      case @direction
        when 'up'    then new_direction != 'down'
        when 'down'  then new_direction != 'up'
        when 'left'  then new_direction != 'right'
        when 'right' then new_direction != 'left'
      end
    end

    def hit_itself?
      @positions.uniq.length != @positions.length
    end

    def head
      @positions.last
    end

    private

    def push_new_position
      case @direction
        when 'down'  then @positions.push(go_down)
        when 'up'    then @positions.push(go_up)
        when 'left'  then @positions.push(go_left)
        when 'right' then @positions.push(go_right)
      end
    end

    def go_left
      new_coords(x: head[0] - 1, y: head[1])
    end

    def go_right
      new_coords(x: head[0] + 1, y: head[1])
    end

    def go_up
      new_coords(x: head[0], y: head[1] - 1)
    end

    def go_down
      new_coords(x: head[0], y: head[1] + 1)
    end

    def new_coords(x:, y:)
      [x % Config::GRID_WIDTH, y % Config::GRID_HEIGHT]
    end

    def draw_square(x:, y:)
      Ruby2D::Square.new(x: x, y: y, size: Config::GRID_SIZE - 1, color: 'white')
    end
  end
end
