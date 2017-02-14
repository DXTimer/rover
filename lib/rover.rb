require_relative 'position'

class Rover

  attr_reader :position
  
  def initialize(input)
    @position = Position.new(input[0], input[1], input[-1])
  end

  def follow_instruction(letter)
    letter == 'L' || letter == 'R' ? @position.direction = adjust_direction(letter, @position.direction) : move(@position.direction)
    @position
  end

  private

  def move(direction)
    case direction
    when 'N' then @position.y += 1
    when 'E' then @position.x += 1
    when 'S' then @position.y -= 1
    when 'W' then @position.x -= 1
    end
  end

  def adjust_direction(letter, direction)
    letter == 'L' ? rotates_left(direction) : rotates_right(direction)
  end

  def rotates_left(direction)
    case direction
    when 'N' then 'W'
    when 'W' then 'S'
    when 'S' then 'E'
    when 'E' then 'N'
    end
  end

  def rotates_right(direction)
    case direction
    when 'N' then 'E'
    when 'E' then 'S'
    when 'S' then 'W'
    when 'W' then 'N'
    end
  end
end
