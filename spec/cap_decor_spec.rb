require_relative '../cap_decor'
require_relative '../basedecorator'

RSpec.describe CapitalizeDecorator do
  let(:nameable) { double('Nameable', correct_name: 'john doe') }
  let(:decorator) { described_class.new(nameable) }

  describe '#correct_name' do
    it 'returns the correct name in uppercase' do
      expect(decorator.correct_name).to eq('JOHN DOE')
    end
  end
end
