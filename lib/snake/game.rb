module Snake
  class Game
    def initialize
      window.set(Config::CONFIG)
    end

    def run
      window.update do
        window.clear
        game_engine_events
      end

      window.on :key_down do |event|
        key_binding(event.key)
      end

      window.show
    end

    private

    def game_engine_events
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

    def key_binding(event_key)
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
