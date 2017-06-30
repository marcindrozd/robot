class Board
  MIN_X = 0
  MIN_Y = 0
  MAX_X = 5
  MAX_Y = 5

  attr_reader :min_x, :min_y, :max_x, :max_y

  def initialize(x: MAX_X, y: MAX_Y)
    @min_x = MIN_X
    @min_y = MIN_Y
    @max_x = x
    @max_y = y
  end

  def element_inside?(x, y)
    x >= min_x && x <= max_x && y >= min_y && y <= max_y
  end
end
