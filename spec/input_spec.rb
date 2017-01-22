require 'input'

describe Input do

  subject(:input) { described_class.new('./spec/fixtures/test_input.txt') }
  let(:instructions) { [[[1, 2, 'N'], ['L', 'M', 'L', 'M', 'L', 'M', 'L', 'M', 'M']],
                        [[3, 3, 'E'], ['M', 'M', 'R', 'M', 'M', 'R', 'M', 'R', 'R', 'M']]] }
  let(:input_array) { [ '1 2 N', 'LMLMLMLMM', '3 3 E', 'MMRMMRMRRM'] }

  describe '#read_file' do
    it 'converts text file into array of string' do
      expect(input.read_file).to eq(input_array)
      expect(input.area_coordinate).to eq("5 5")
    end
  end

  describe '#parse_text' do
    it 'returns instructions for rovers' do
      input.read_file
      expect(input.parse_text).to eq(instructions)
    end
  end
end
