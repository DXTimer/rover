class Plateau
  
  attr_accessor :beacon

  def initialize(x_limit, y_limit)
    @x_limit = x_limit
    @y_limit = y_limit
    @beacon = []
  end

  def beacon_exists?(position)
    beacon.include?(position)
  end

  def rover_out_of_bound?(position)
    return true if reach_east_limit?(position)
    return true if reach_west_limit?(position)
    return true if reach_north_limit?(position)
    return true if reach_south_limit?(position)
  end

  def reach_east_limit?(position)
    position.x > @x_limit && position.direction == 'E'
  end

  def reach_west_limit?(position)
    position.x < 0 && position.direction == 'W'
  end

  def reach_north_limit?(position)
    position.y > @y_limit && position.direction == 'N'
  end

  def reach_south_limit?(position)
    position.y < 0 && position.direction == 'S'
  end

end
