require 'rover'

describe Rover do

  subject(:rover) { described_class.new(position, instructions)}
  let(:position) { [1, 2, 'N'] }
  let(:instructions) { ['L', 'M', 'L', 'M', 'L', 'M', 'L', 'M', 'M'] }
  let(:direction_array) { ['N', 'E', 'S', 'W'] }

  describe '#move' do
    it 'makes the move from N direction' do
      expect(rover.move(direction_array[0], position)).to eq([1, 3, 'N'])
    end

    it 'makes the move from E direction' do
      expect(rover.move(direction_array[1], position)).to eq([2, 2, 'N'])
    end

    it 'makes the move from S direction' do
      expect(rover.move(direction_array[2], position)).to eq([1, 1, 'N'])
    end

    it 'makes the move from W direction' do
      expect(rover.move(direction_array[3], position)).to eq([0, 2, 'N'])
    end
  end

  describe '#adjust_direction' do
    context 'rotates 90 degree left' do
      let(:letter) { 'L' }

      it 'rotates from N direction' do
        expect(rover.adjust_direction(letter, direction_array[0], direction_array)).to eq('W')
      end

      it 'rotates from E direction' do
        expect(rover.adjust_direction(letter, direction_array[1], direction_array)).to eq('N')
      end

      it 'rotates from S direction' do
        expect(rover.adjust_direction(letter, direction_array[2], direction_array)).to eq('E')
      end

      it 'rotates from W direction' do
        expect(rover.adjust_direction(letter, direction_array[3], direction_array)).to eq('S')
      end
    end

    context 'rotates 90 degree right' do
      let(:letter) { 'R' }

      it 'rotates from N direction' do
        expect(rover.adjust_direction(letter, direction_array[0], direction_array)).to eq('E')
      end

      it 'rotates from E direction' do
        expect(rover.adjust_direction(letter, direction_array[1], direction_array)).to eq('S')
      end

      it 'rotates from S direction' do
        expect(rover.adjust_direction(letter, direction_array[2], direction_array)).to eq('W')
      end

      it 'rotates from W direction' do
        expect(rover.adjust_direction(letter, direction_array[3], direction_array)).to eq('N')
      end
    end
  end

  describe '#follow_instruction' do
    it 'executes the first set of instructions' do
      expect(rover.follow_instruction).to eq('1 3 N')
    end

    it 'executes the second set of instructions' do
      position_2 = [3, 3, 'E']
      instructions_2 = ['M', 'M', 'R', 'M', 'M', 'R', 'M', 'R', 'R', 'M']
      rover = Rover.new(position_2, instructions_2)
      expect(rover.follow_instruction).to eq('5 1 E')
    end
  end

end
