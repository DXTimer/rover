class Position

  attr_reader :x_coordinate, :y_coordinate, :direction

  def initialize(position)
    @position = position.clone
    @x_coordinate = @position[0]
    @y_coordinate = @position[1]
    @direction = @position[-1]
  end
end
