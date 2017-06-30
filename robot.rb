require_relative "./constants/robot_settings"
require_relative "./modules/reportable"
require_relative "board"

class Robot
  include RobotSettings
  include Reportable

  attr_accessor :x, :y, :facing, :placed

  def initialize(board: Board.new)
    @x = nil
    @y = nil
    @facing = nil
    @placed = false
    @board = board
  end

  def place(x, y, facing)
    return unless board.element_inside?(x, y)

    self.x = x
    self.y = y
    self.facing = facing
    self.placed = true
  end

  def move
    return if !placed

    if facing == NORTH && board.element_inside?(x, y + WALK_SPEED)
      self.y += WALK_SPEED
    elsif facing == SOUTH && board.element_inside?(x, y - WALK_SPEED)
      self.y -= WALK_SPEED
    elsif facing == EAST && board.element_inside?(x + WALK_SPEED, y)
      self.x += WALK_SPEED
    elsif facing == WEST && board.element_inside?(x - WALK_SPEED, y)
      self.x -= WALK_SPEED
    end
  end

  def left
    return if !placed

    self.facing = DIRECTIONS[(DIRECTIONS.index(facing) - TURN_SPEED) % DIRECTIONS.length]
  end

  def right
    return if !placed

    self.facing = DIRECTIONS[(DIRECTIONS.index(facing) + TURN_SPEED) % DIRECTIONS.length]
  end

  private

  attr_reader :board
end

# ---------------------
# TEST DATA
# ---------------------

if __FILE__ == $0
  robot = Robot.new

  puts "Placing robot..."
  robot.place 1, 2, EAST

  puts "Moving to the east..."
  robot.move

  puts "Moving to the east..."
  robot.move

  puts "Turning left..."
  robot.left

  puts "Moving to the north..."
  robot.move

  puts "Moving to the north..."
  robot.move

  puts "Turning right..."
  robot.right

  puts "Turning right..."
  robot.right

  puts "Moving to the south..."
  robot.move

  puts "Reporting position..."
  robot.report
end
