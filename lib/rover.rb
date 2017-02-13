class Rover

  def initialize(position = Position.new, instructions)
    @position = position
    @instructions = instructions
  end

  def follow_instruction(letter)
    if letter == 'L' || letter == 'R'
      @direction = adjust_direction(letter, @direction)
    else
      move(@position.direction)
    end
    @position 
  end

  private

  def move(direction)
    case direction
    when 'N' then @position.y_coordinate += 1
    when 'E' then @position.x_coordinate += 1
    when 'S' then @position.y_coordinate -= 1
    when 'W' then @position.x_coordinate -= 1
    end
  end

  def adjust_direction(letter, current_direction)
    letter == 'L' ? rotates_left(current_direction) : rotates_right(current_direction)
  end

  def rotates_left(current_direction)
    case current_direction
    when 'N' then 'W'
    when 'W' then 'S'
    when 'S' then 'E'
    when 'E' then 'N'
    end
  end

  def rotates_right(current_direction)
    case current_direction
    when 'N' then 'E'
    when 'E' then 'S'
    when 'S' then 'W'
    when 'W' then 'N'
    end
  end
end
