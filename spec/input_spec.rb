require 'input'

describe Input do

  subject(:input) { described_class.new(file) }
  let(:file) { double :file }
  let(:instructions) { [[[1, 2, 'N'], ['L', 'M', 'L', 'M', 'L', 'M', 'L', 'M', 'M']],
                        [[3, 3, 'E'], ['M', 'M', 'R', 'M', 'M', 'R', 'M', 'R', 'R', 'M']]] }

  describe '#parse_text' do
    it 'returns instructions for rovers' do
      expect(input.parse_text).to eq(instructions)
    end
  end
end
