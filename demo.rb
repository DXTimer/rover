require './lib/input'
require './lib/rover'
require './lib/controller'

input = Input.new('./spec/fixtures/test_input.txt')
controller = Controller.new(input)

p controller.activate_rovers
