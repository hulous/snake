module Snake
  class Game
    def initialize
      window.set(Config::CONFIG)
    end

    def run
      window.update do
        window.clear

        draw_items
        record_food_eaten if food.eaten?(snake.head)
        player.lose if snake.hit_itself?
      end

      window.on :key_down do |event|
        event_key = event.key

        snake_change_direction(event_key)
        player_quit_or_replay(event_key)
      end

      window.show
    end

    private

    def draw_items
      unless player.lose?
        snake.move
        food.draw
      end

      snake.draw
      player.draw
    end

    def record_food_eaten
      player.record_eat
      snake.grow
      @food = nil
    end

    def snake_change_direction(key)
      snake.direction = key if %w[up down left right].include?(key) && snake.can_change_direction_to?(key)
    end

    def player_quit_or_replay(key)
      if player.lose?
        if key.eql?('r')
          @snake = nil
          @player = nil
        end

        exit(0) if key.eql?('q')
      end
    end

    def window
      @window ||= Ruby2D::Window
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
