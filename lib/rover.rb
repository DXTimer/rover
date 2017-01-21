class Rover

  attr_reader :position, :direction_array

  def initialize(position, instructions)
    @position = position
    @instructions = instructions
    @direction_array = ['N', 'E', 'S', 'W']
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
        position[-1] = adjust_direction(letter, position[-1], direction_array)
      else
        move(position[-1], position)
      end
    end
    position.join(" ")
  end
end
