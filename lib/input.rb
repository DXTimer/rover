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
    input_array.map!.with_index do |item, index|
      if index.even?
        item.split(' ').map! do |i|
          i = i.to_i if i =~ /\d/
          i
        end
      else
        item.split('')
      end
    end.each_slice(2) { |i| @rovers_instructions << i }
  end
end
