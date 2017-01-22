require 'rover'

describe Rover do

  subject(:rover) { described_class.new(position, instructions, area_coordinate)}
  let(:area_coordinate) { [5, 5] }
  let(:position) { [1, 2, 'N'] }
  let(:instructions) { ['L', 'M', 'L', 'M', 'L', 'M', 'L', 'M', 'M'] }
  let(:direction_array) { ['N', 'E', 'S', 'W'] }
  let(:north) { 'N' }
  let(:south) { 'S' }
  let(:east) { 'E' }
  let(:west) { 'W' }

  describe '#move' do
    it 'makes the move from North' do
      expect(rover.move(north, position)).to eq([1, 3, 'N'])
    end
    
    it 'makes the move from East' do
      expect(rover.move(east, position)).to eq([2, 2, 'N'])
    end

    it 'makes the move from South' do
      expect(rover.move(south, position)).to eq([1, 1, 'N'])
    end

    it 'makes the move from West' do
      expect(rover.move(west, position)).to eq([0, 2, 'N'])
    end
  end

  describe '#adjust_direction' do
    context 'rotates 90 degree left' do
      let(:letter) { 'L' }

      it 'rotates from North' do
        expect(rover.adjust_direction(letter, north, direction_array)).to eq('W')
      end

      it 'rotates from East' do
        expect(rover.adjust_direction(letter, east, direction_array)).to eq('N')
      end

      it 'rotates from South' do
        expect(rover.adjust_direction(letter, south, direction_array)).to eq('E')
      end

      it 'rotates from West' do
        expect(rover.adjust_direction(letter, west, direction_array)).to eq('S')
      end
    end

    context 'rotates 90 degree right' do
      let(:letter) { 'R' }

      it 'rotates from North' do
        expect(rover.adjust_direction(letter, north, direction_array)).to eq('E')
      end

      it 'rotates from East' do
        expect(rover.adjust_direction(letter, east, direction_array)).to eq('S')
      end

      it 'rotates from South' do
        expect(rover.adjust_direction(letter, south, direction_array)).to eq('W')
      end

      it 'rotates from West' do
        expect(rover.adjust_direction(letter, west, direction_array)).to eq('N')
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
      rover = Rover.new(position_2, instructions_2, area_coordinate)
      expect(rover.follow_instruction).to eq('5 1 E')
    end
  end

  context 'in y plane' do
    it 'returns current coordinate if next move is out of bound' do
      instructions_3 = ['M', 'M', 'M', 'M', 'M']
      rover = Rover.new(position, instructions_3, area_coordinate)
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
