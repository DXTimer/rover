require './lib/input'
require './lib/rover'
require './lib/controller'
require './lib/position'
require './lib/plateau'

input = Input.new('./spec/fixtures/test_input.txt')
controller = Controller.new(input)

p input.parse_text
p controller.activate_rovers

# print text file instead of returning array
