require 'rspec'
require_relative '../teacher'

describe Teacher do
  let(:teacher) { Teacher.new('Math', 35, 'John Doe') }

  describe '#specialization' do
    it 'returns the specialization' do
      expect(teacher.specialization).to eq('Math')
    end
  end

  describe '#name' do
    it 'returns the name' do
      expect(teacher.name).to eq('John Doe')
    end
  end

  describe '#age' do
    it 'returns the age' do
      expect(teacher.age).to eq(35)
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      expect(teacher.can_use_services?).to be true
    end
  end
end
