module Snake
  module Config

    WIDTH = 640      # width = 640 / 20 = 32
    HEIGHT = 480     # height = 480 / 20 = 24
    FPS_CAP = 5

    GRID_SIZE = 20
    GRID_WIDTH = WIDTH / GRID_SIZE
    GRID_HEIGHT = HEIGHT / GRID_SIZE

    CONFIG = {
      title: "Snake Game",
      background: 'navy',
      fps_cap: FPS_CAP,
      width: WIDTH,
      height: HEIGHT
    }.freeze

  end
end
