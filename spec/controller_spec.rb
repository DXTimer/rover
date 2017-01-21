require 'controller'
require 'input'

describe Controller do
  subject(:controller) { described_class.new(input)}
  let(:input) { double :input, rovers_instructions: instructions }
  let(:instructions) { [[[1, 2, 'N'], ['L', 'M', 'L', 'M', 'L', 'M', 'L', 'M', 'M']],
                        [[3, 3, 'E'], ['M', 'M', 'R', 'M', 'M', 'R', 'M', 'R', 'R', 'M']]] }
  let(:results) { ['1 3 N', '5 1 E'] }

  describe '#activate_rovers' do
    before(:each) do
      class_double('Rover').as_stubbed_const(follow_instruction: "", new: Rover)
      # allow_any_instance_of(Rover).to receive(:follow_instruction).and_return("")
    end

    it 'instantiates instances of rover' do
      expect(Rover).to receive(:new).with(instructions[0][0], instructions[0][1])
      expect(Rover).to receive(:new).with(instructions[1][0], instructions[1][1])
      controller.activate_rovers
    end

    it 'returns the final coordinate from all the rovers' do
      controller.activate_rovers
      expect(controller.activate_rovers).to eq(results)
    end

  end
end
