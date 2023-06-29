require_relative '../solver'

RSpec.describe Solver do
  describe '#factorial' do
    it 'returns the factorial of a positive integer' do
      expect(Solver.factorial(5)).to eq(120)
    end

    it 'returns 1 for factorial of 0' do
      expect(Solver.factorial(0)).to eq(1)
    end

    it 'raises an exception for negative integer' do
      expect { Solver.factorial(-3) }.to raise_error(ArgumentError)
    end
  end

  describe '#reverse' do
    it 'reverses a word' do
      expect(Solver.reverse('hello')).to eq('olleh')
    end
  end

  describe '#fizzbuzz' do
    it 'returns "fizz" when N is divisible by 3' do
      expect(Solver.fizzbuzz(9)).to eq('fizz')
    end

    it 'returns "buzz" when N is divisible by 5' do
      expect(Solver.fizzbuzz(10)).to eq('buzz')
    end

    it 'returns "fizzbuzz" when N is divisible by both 3 and 5' do
      expect(Solver.fizzbuzz(15)).to eq('fizzbuzz')
    end

    it 'returns N as a string for any other case' do
      expect(Solver.fizzbuzz(7)).to eq('7')
    end
  end
end
