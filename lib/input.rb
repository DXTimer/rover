class Input

  attr_reader :area_coordinate, :rovers_instructions, :input_array

  def initialize(file)
    @file = file
    @area_coordinate = ""
    @rovers_instructions = []
    @input_array = []
  end

  def read_file
    File.readlines(@file).each do |line|
      @input_array << line.strip
    end
    input_array
  end

  def parse_text
    @area_coordinate = input_array.shift
    input_array.each_slice(2) { |i| @rovers_instructions << i }
  end
end
