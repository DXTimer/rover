class Input

  attr_reader :area_coordinate

  def initialize(file)
    @file = file
    @area_coordinate = ""
  end

  def parse_text
    read_file.each_slice(2).map do |(position, instructions)|
      x, y, direction = position.split(' ')
      new_position = [x.to_i, y.to_i, direction]
      new_instructions = instructions.split('')
      [new_position, new_instructions]
    end
  end

  private

  def read_file
    input_array = File.readlines(@file).map do |line|
      line.strip
    end
    @area_coordinate = input_array.shift.split(' ').map { |i| i.to_i }
    input_array
  end

end
