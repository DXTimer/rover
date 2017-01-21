require 'rover'

class Controller

  attr_reader :input, :results

 def initialize(input, rover = Rover)
   @input = input.rovers_instructions
   @rover = rover
   @results = []
 end

 def activate_rovers
   a = 0
   input.count.times do |i|
     rover = Rover.new(input[a][0], input[a][1])
     @results << @rover.follow_instruction
     a += 1
   end
 end
end
