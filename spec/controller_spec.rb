require 'controller'
require 'input'

describe Controller do
  subject(:controller) { described_class.new(inputs)}
  let(:inputs) { double :inputs }

  describe '#activate_rovers' do

    before(:each) do
      allow(inputs).to receive(:max_coordinates).and_return([5, 5])
    end

    describe 'in bounds' do
      it 'returns output of first rover' do
        input = [[[1, 2, 'N'], ['L', 'M', 'L', 'M', 'L', 'M', 'L', 'M', 'M']]]
        allow(inputs).to receive(:parse_text).and_return(input)
        expect(controller.activate_rovers).to eq(['1 3 N'])
      end

      it 'returns output of second rover' do
        input = [[[3, 3, 'E'], ['M', 'M', 'R', 'M', 'M', 'L', 'M', 'R', 'R', 'M']]]
        allow(inputs).to receive(:parse_text).and_return(input)
        expect(controller.activate_rovers).to eq(['5 1 E'])
      end

      it 'returns output of third rover' do
        input = [[[4, 1, 'S'], ['M', 'L', 'M', 'L', 'M', 'R', 'M', 'R', 'M']]]
        allow(inputs).to receive(:parse_text).and_return(input)
        expect(controller.activate_rovers).to eq(['5 0 S'])
      end

      it 'returns the final coordinate from all the rovers' do
        input = [[[1, 2, 'N'], ['L', 'M', 'L', 'M', 'L', 'M', 'L', 'M', 'M']],
                      [[3, 3, 'E'], ['M', 'M', 'R', 'M', 'M', 'R', 'M', 'R', 'R', 'M']]]
        allow(inputs).to receive(:parse_text).and_return(input)
        expect(controller.activate_rovers).to eq(['1 3 N', '5 1 E'])
      end
    end

    describe 'out of bounds' do
      context 'in y plane' do
        it 'returns current coordinate if next move is out of upper bound' do
          input = [[[1, 4, 'N'], ['M', 'M']]]
          allow(inputs).to receive(:parse_text).and_return(input)
          expect(controller.activate_rovers).to eq(['1 5 N'])
        end

        it 'returns current coordinate if next move is out of lower bound' do
          input = [[[1, 1, 'S'], ['M', 'M']]]
          allow(inputs).to receive(:parse_text).and_return(input)
          expect(controller.activate_rovers).to eq(['1 0 S'])
        end
      end

      context 'in x plane' do
        it 'returns current coordinate if next move is out of upper bound' do
          input = [[[4, 1, 'E'], ['M', 'M']]]
          allow(inputs).to receive(:parse_text).and_return(input)
          expect(controller.activate_rovers).to eq(['5 1 E'])
        end

        it 'returns current coordinate if next move is out of lower bound' do
          input = [[[1, 1, 'W'], ['M', 'M']]]
          allow(inputs).to receive(:parse_text).and_return(input)
          expect(controller.activate_rovers).to eq(['0 1 W'])
        end
      end
    end

  end
  # need more smaller test

end
