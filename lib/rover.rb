class Rover

  DIRECTION_ARRAY = ['N', 'E', 'S', 'W']

  def initialize(position, instructions, area_coordinate)
    @position = position.clone
    @instructions = instructions
    @area_coordinate = area_coordinate
  end

  def move(direction, position)
    case direction
    when 'N' then position[1] += 1
    when 'E' then position[0] += 1
    when 'S' then position[1] -= 1
    when 'W' then position[0] -= 1
    end
    position
  end

  def adjust_direction(letter, direction, direction_array)
    if letter == 'L'
      direction == 'N' ? 'W' : direction_array[(direction_array.index(direction)) - 1]
    else
      direction == 'W' ? 'N' : direction_array[(direction_array.index(direction)) + 1]
    end
  end

  def follow_instruction
    @instructions.each do |letter|
      if letter == 'L' || letter == 'R'
        @position[-1] = adjust_direction(letter, @position[-1], DIRECTION_ARRAY)
      else
        break if check_position(@position[-1])
        move(@position[-1], @position)
      end
    end
    @position.join(" ")
  end

  def check_position(current_direction)
    return true if @position[0] >= @area_coordinate[0] && current_direction == 'E'
    return true if @position[1] >= @area_coordinate[1] && current_direction == 'N'
  end
end
