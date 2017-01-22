class Input

  attr_reader :area_coordinate, :input_array

  def initialize(file)
    @file = file
    # @area_coordinate = ""
    @input_array = []
  end

  def read_file
    File.readlines(@file).each do |line|
      @input_array << line.strip
    end
    #map with assign to input
    area_coordinate = input_array.shift
    input_array
  end

  def parse_text
    input_array.each_slice(2).map do |(even, odd)|
      a, b, c = even.split(' ')
      new_even = [a.to_i, b.to_i, c]

      new_odd = odd.split('')

      [new_even, new_odd]
    end

  end
end
