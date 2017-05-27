MIN_X = 0
MIN_Y = 0
MAX_X = 5
MAX_Y = 5

@x = nil
@y = nil
@direction = nil

def place(x, y, direction)
  @x = x
  @y = y
  @direction = direction
end

def move
  if @direction == "NORTH" && @y < MAX_Y
    @y += 1
  elsif @direction == "SOUTH" && @y > MIN_Y
    @y -= 1
  elsif @direction == "EAST" && @x < MAX_X
    @x += 1
  elsif @direction == "WEST" && @x > MIN_X
    @x -= 1
  end
end

def left
end

def right
end

def report
  [@x, @y, @direction].join(",")
end
