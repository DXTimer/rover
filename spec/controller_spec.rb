require 'controller'
require 'input'

describe Controller do
  subject(:controller) { described_class.new(input)}
  let(:input) { double :input, rovers_instructions: instructions }
  let(:instructions) { [[[1, 2, 'N'], ['L', 'M', 'L', 'M', 'L', 'M', 'L', 'M', 'M']],
                        [[3, 3, 'E'], ['M', 'M', 'R', 'M', 'M', 'R', 'M', 'R', 'R', 'M']]] }

  describe '#activate_rovers' do
    it 'returns the final coordinate from all the rovers' do
      expect(controller.activate_rovers).to eq(['1 3 N', '5 1 E'])
    end
  end
end
