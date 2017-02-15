require './lib/input'
require './lib/rover'
require './lib/controller'
require './lib/position'
require './lib/plateau'

input = Input.new('./spec/fixtures/test_input.txt')
controller = Controller.new(input)

controller.activate_rovers.each { |i| puts i }
