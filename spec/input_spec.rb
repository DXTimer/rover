require 'input'

describe Input do

  subject(:input) { described_class.new(text_file) }
  let(:text_file) { double :text_file }

  describe '#parse_text' do
    it 'returns instructions for rovers' do
      expect(input.parse_text).to eq(instructions)
    end
  end
end
