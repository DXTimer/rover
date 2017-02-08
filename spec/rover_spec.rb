require 'rover'

describe Rover do

  subject(:rover) { described_class.new(position, instructions, area_coordinate)}
  let(:area_coordinate) { [5, 5] }
  let(:position) { [1, 2, 'N'] }
  let(:instructions) { ['L', 'M', 'L', 'M', 'L', 'M', 'L', 'M', 'M'] }

  describe '#follow_instruction' do
    it 'executes the letter L of instructions' do
      letter = 'L'
      expect(rover.follow_instruction(letter)).to eq([1, 2, 'W'])
    end

    it 'executes the letter M of instructions' do
      letter = 'M'
      expect(rover.follow_instruction(letter)).to eq([1, 3, 'N'])
    end

    it 'executes the letter R of instructions' do
      letter = 'R'
      expect(rover.follow_instruction(letter)).to eq([1, 2, 'E'])
    end
  end
end
