module Snake
  class Game
    WIDTH = 640      # width = 640 / 20 = 32
    HEIGHT = 480     # height = 480 / 20 = 24
    FPS_CAP = 5

    GRID_SIZE = 20
    GRID_HEIGHT = Ruby2D::Window.height / GRID_SIZE
    GRID_WIDTH = Ruby2D::Window.width / GRID_SIZE

    def initialize
      Ruby2D::Window.set(title: 'Snake')
      Ruby2D::Window.set(background: 'navy')
      Ruby2D::Window.set(fps_cap: Game::FPS_CAP)
      Ruby2D::Window.set(width: Game::WIDTH)
      Ruby2D::Window.set(height: Game::HEIGHT)
    end

    def run
      Ruby2D::Window.update do
        Ruby2D::Window.clear

        unless player.lose?
          snake.move
          food.draw
        end

        snake.draw
        player.draw

        if food.eaten?(snake.head)
          player.record_eat
          snake.move(after_eat: true) # grow
          @food = nil
        end

        player.lose if snake.hit_itself?
      end

      Ruby2D::Window.on :key_down do |event|
        event_key = event.key

        if %w[up down left right].include?(event_key)
          if snake.can_change_direction_to?(event_key)
            snake.direction = event_key
          end
        end

        if player.lose?
          if event_key.eql?('r')
            @snake = nil
            @player = nil
          end

          exit(0) if event_key.eql?('q')
        end
      end

      Ruby2D::Window.show
    end

    def snake
      @snake ||= Snake.new
    end

    def food
      @food ||= Food.new
    end

    def player
      @player ||= Player.new
    end
  end
end
