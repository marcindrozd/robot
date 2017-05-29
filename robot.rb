MIN_X = 0.freeze
MIN_Y = 0.freeze
MAX_X = 5.freeze
MAX_Y = 5.freeze
NORTH = "NORTH".freeze
EAST = "EAST".freeze
SOUTH = "SOUTH".freeze
WEST = "WEST".freeze
TURN_SPEED = 1.freeze
WALK_SPEED = 1.freeze
DIRECTIONS = [NORTH, EAST, SOUTH, WEST].freeze

@x = nil
@y = nil
@facing = nil

def place(x, y, facing)
  return if robot_outside_the_grid?(x, y)

  @x = x
  @y = y
  @facing = facing
end

def move
  if @facing == NORTH && @y < MAX_Y
    @y += WALK_SPEED
  elsif @facing == SOUTH && @y > MIN_Y
    @y -= WALK_SPEED
  elsif @facing == EAST && @x < MAX_X
    @x += WALK_SPEED
  elsif @facing == WEST && @x > MIN_X
    @x -= WALK_SPEED
  end
end

def left
  return if @facing.nil?

  @facing = DIRECTIONS[(DIRECTIONS.index(@facing) - TURN_SPEED) % DIRECTIONS.length]
end

def right
  return if @facing.nil?

  @facing = DIRECTIONS[(DIRECTIONS.index(@facing) + TURN_SPEED) % DIRECTIONS.length]
end

def report
  [@x, @y, @facing].join(",")
end

def robot_outside_the_grid?(x, y)
  x < MIN_X || x > MAX_X || y < MIN_Y || y > MAX_Y
end
