require 'rover'

describe Rover do

  subject(:rover) { described_class.new(input)}
  let(:input) { [1, 2, 'N'] }

  describe '#follow_instruction' do
    it 'executes the letter L of instructions' do
      new_input = Position.new(1, 2, 'W')
      letter = 'L'
      expect(rover.follow_instruction(letter)).to eq(new_input)
    end

    it 'executes the letter M of instructions' do
      new_input = Position.new(1, 3, 'N')
      letter = 'M'
      expect(rover.follow_instruction(letter)).to eq(new_input)
    end

    it 'executes the letter R of instructions' do
      new_input = Position.new(1, 2, 'E')
      letter = 'R'
      expect(rover.follow_instruction(letter)).to eq(new_input)
    end
  end
end
