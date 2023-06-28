require_relative '../trim_decor'
require_relative '../basedecorator'

RSpec.describe TrimmerDecorator do
  let(:nameable) { double('Nameable', correct_name: 'John Doe') }
  let(:decorator) { described_class.new(nameable) }

  describe '#correct_name' do
    context 'when the name is longer than the maximum length' do
      let(:nameable) { double('Nameable', correct_name: 'This is a long name') }

      it 'returns the trimmed name' do
        expect(decorator.correct_name).to eq('This is a ')
      end
    end

    context 'when the name is shorter than or equal to the maximum length' do
      it 'returns the original name' do
        expect(decorator.correct_name).to eq('John Doe')
      end
    end
  end
end
