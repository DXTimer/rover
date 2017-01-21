require 'controller'
require 'input'

describe Controller do
  subject(:controller) { described_class.new(input, rover)}
  let(:input) { double :input, rovers_instructions: instructions }
  let(:rover) { double :rover }
  let(:instructions) { [[[1, 2, 'N'], ['L', 'M', 'L', 'M', 'L', 'M', 'L', 'M', 'M']],
                        [[3, 3, 'E'], ['M', 'M', 'R', 'M', 'M', 'R', 'M', 'R', 'R', 'M']]] }
  let(:results) { ['1 3 N', '5 1 E'] }

  describe '#activate_rovers' do

    it 'instantiates instances of rover' do
      class_double('Rover', :follow_instruction).as_stubbed_const
      Rover.any_stance.stub(:follow_instruction)
      expect(Rover).to receive(:new).with(instructions[0][0], instructions[0][1])
      expect(Rover).to receive(:new).with(instructions[1][0], instructions[1][1])
      controller.activate_rovers
    end

    it 'returns the final coordinate from all the rovers' do
      class_double('Rover', :follow_instruction, :new).as_stubbed_const
      controller.activate_rovers
      expect(controller.results).to eq(results)
    end

  end
end
