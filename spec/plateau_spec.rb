require 'plateau'
require 'position'

describe Plateau do
  subject(:plateau) { described_class.new(5, 5)}

  describe '#beacon_exists?' do
    before(:each) do
      beacon = ['1 1 N', '5 1 E']
      allow(plateau).to receive(:beacon).and_return(beacon)
    end

    context 'returns true' do
      it 'if position 1 1 N is included in beacon array' do
        position = '1 1 N'
        expect(plateau.beacon_exists?(position)).to be true
      end

      it 'if position 5 1 E is included in beacon array' do
        position = '5 1 E'
        expect(plateau.beacon_exists?(position)).to be true
      end
    end

    context 'returns false' do
      it 'if position 1 2 N is not included in beacon array' do
        position = '1 2 N'
        expect(plateau.beacon_exists?(position)).to be false
      end

      it 'if position 5 1 N is not included in beacon array' do
        position = '5 1 N'
        expect(plateau.beacon_exists?(position)).to be false
      end
    end
  end

  describe '#rover_out_of_bound?' do
    context 'returns true' do
      it 'if rover passes east limit' do
        position = Position.new(6, 1, 'E')
        expect(plateau.rover_out_of_bound?(position)).to be true
      end

      it 'if rover passes west limit' do
        position = Position.new(-1, 1, 'W')
        expect(plateau.rover_out_of_bound?(position)).to be true
      end

      it 'if rover passes north limit' do
        position = Position.new(1, 6, 'N')
        expect(plateau.rover_out_of_bound?(position)).to be true
      end

      it 'if rover passes south limit' do
        position = Position.new(1, -1, 'S')
        expect(plateau.rover_out_of_bound?(position)).to be true
      end
    end

    context 'returns nil' do
      it 'if rover position 1 1 N is within bounds' do
        position = Position.new(1, 1, 'N')
        expect(plateau.rover_out_of_bound?(position)).to be_nil
      end

      it 'if rover position 3 4 E is within bounds' do
        position = Position.new(3, 4, 'E')
        expect(plateau.rover_out_of_bound?(position)).to be_nil
      end
    end
  end
end
