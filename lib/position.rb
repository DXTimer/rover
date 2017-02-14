class Position

  attr_accessor :x, :y, :direction

  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def ==(another_position)
    self.x == another_position.x
    self.y == another_position.y
    self.direction == another_position.direction
  end
end
