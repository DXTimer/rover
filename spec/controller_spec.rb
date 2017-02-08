require 'controller'
require 'input'

describe Controller do
  subject(:controller) { described_class.new(input)}
  let(:input) { double :input, parse_text: instructions }
  let(:instructions) { [[[1, 2, 'N'], ['L', 'M', 'L', 'M', 'L', 'M', 'L', 'M', 'M']],
                        [[3, 3, 'E'], ['M', 'M', 'R', 'M', 'M', 'R', 'M', 'R', 'R', 'M']]] }

  describe '#activate_rovers' do
    it 'returns the final coordinate from all the rovers' do
      allow(input).to receive(:area_coordinate).and_return([5, 5])
      expect(controller.activate_rovers).to eq(['1 3 N', '5 1 E'])
    end
  end

  describe '#out_of_bound?' do
    before(:each) do
      instructions_2 = [[1, 2, 'N'], ['M', 'M', 'M', 'M', 'M']]
      allow(input).to receive(:parse_text).and_return(instructions_2)
      allow(input).to receive(:area_coordinate).and_return([5, 5])
    end
    
    context 'in y plane' do
      it 'returns current coordinate if next move is out of bound' do
        expect(rover.follow_instruction).to eq('1 5 N')
      end
    end

    context 'in x plane' do
      it 'returns current coordinate if next move is out of bound' do
        position_2 = [3, 3, 'E']
        instructions_4 = ['M', 'M', 'M', 'M', 'M']
        rover = Rover.new(position_2, instructions_4, area_coordinate)
        expect(rover.follow_instruction).to eq('5 3 E')
      end
    end
  end
end
