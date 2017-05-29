NORTH = "NORTH".freeze
EAST = "EAST".freeze
SOUTH = "SOUTH".freeze
WEST = "WEST".freeze

class RobotV2
  MIN_X = 0.freeze
  MIN_Y = 0.freeze
  MAX_X = 5.freeze
  MAX_Y = 5.freeze
  TURN_SPEED = 1.freeze
  WALK_SPEED = 1.freeze
  DIRECTIONS = [NORTH, EAST, SOUTH, WEST].freeze

  attr_accessor :x, :y, :facing, :placed

  def initialize
    @x = nil
    @y = nil
    @facing = nil
    @placed = false
  end

  def place(x, y, facing)
    return if robot_outside_the_grid?(x, y)

    self.x = x
    self.y = y
    self.facing = facing
    self.placed = true
  end

  def move
    if facing == NORTH && y < MAX_Y
      self.y += WALK_SPEED
    elsif facing == SOUTH && y > MIN_Y
      self.y -= WALK_SPEED
    elsif facing == EAST && x < MAX_X
      self.x += WALK_SPEED
    elsif facing == WEST && x > MIN_X
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

  def report
    return if !placed

    [x, y, facing].join(",")
  end

  private

  def robot_outside_the_grid?(x, y)
    x < MIN_X || x > MAX_X || y < MIN_Y || y > MAX_Y
  end
end

# ---------------------
# TEST DATA
# ---------------------

if __FILE__ == $0
  robot = RobotV2.new

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
  puts robot.report
end
