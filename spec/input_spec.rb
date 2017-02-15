require 'input'

describe Input do

  subject(:input) { described_class.new('./spec/fixtures/test_input.txt') }
  let(:instructions) { [[[1, 2, "N"], ["L", "M", "L", "M", "L", "M", "L", "M", "M"]],
                        [[3, 3, "E"], ["M", "M", "R", "M", "M", "L", "M", "R", "R", "M"]],
                        [[4, 1, "S"], ["M", "L", "M", "L", "M", "R", "M", "R", "M"]]] }

  describe '#parse_text' do
    it 'returns instructions for rovers' do
      expect(input.parse_text).to eq(instructions)
    end
  end
end
