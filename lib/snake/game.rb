module Snake
  class Game
    GRID_SIZE = 20
    WIDTH = 640      # width = 640 / 20 = 32
    HEIGHT = 480     # height = 480 / 20 = 24

    def initialize
      Ruby2D::Window.set(title: 'Snake')
      Ruby2D::Window.set(background: 'navy')
      Ruby2D::Window.set(fps_cap: 1)
      Ruby2D::Window.set(width: Game::WIDTH)
      Ruby2D::Window.set(height: Game::HEIGHT)
    end

    def run
      Ruby2D::Window.update do
        Ruby2D::Window.clear
        snake.move
        snake.draw
      end

      Ruby2D::Window.show
    end

    def snake
      @snake ||= Snake.new
    end
  end
end
