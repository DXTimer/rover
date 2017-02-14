class Input

  attr_reader :max_coordinates

  def initialize(file)
    @file = file
    @max_coordinates = ""
  end

  def parse_text
    read_text_file.each_slice(2).map do |(position, instructions)|
      x, y, direction = position.split(' ')
      new_position = [x.to_i, y.to_i, direction]
      new_instructions = instructions.split('')
      [new_position, new_instructions]
    end
  end

  private

  def read_text_file
    input_array = File.readlines(@file).map do |line|
      line.strip
    end
    @max_coordinates = input_array.shift.split(' ').map { |i| i.to_i }
    input_array
  end
end
