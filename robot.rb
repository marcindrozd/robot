MIN_X = 0
MIN_Y = 0
MAX_X = 5
MAX_Y = 5

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
  if @facing == "NORTH" && @y < MAX_Y
    @y += 1
  elsif @facing == "SOUTH" && @y > MIN_Y
    @y -= 1
  elsif @facing == "EAST" && @x < MAX_X
    @x += 1
  elsif @facing == "WEST" && @x > MIN_X
    @x -= 1
  end
end

def left
end

def right
end

def report
  [@x, @y, @facing].join(",")
end

def robot_outside_the_grid?(x, y)
  x < MIN_X || x > MAX_X || y < MIN_Y || y > MAX_Y
end
