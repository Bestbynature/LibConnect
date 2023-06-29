class Solver
  def self.factorial(arg)
    raise ArgumentError, 'Factorial not defined for negative integers' if arg.negative?

    (1..arg).reduce(1, :*)
  end

  def self.reverse(word)
    word.reverse
  end

  def self.fizzbuzz(arg)
    return 'fizzbuzz' if (arg % 3).zero? && (arg % 5).zero?
    return 'fizz' if (arg % 3).zero?
    return 'buzz' if (arg % 5).zero?

    arg.to_s
  end
end

puts Solver.factorial(5)
puts Solver.reverse('hello')
puts Solver.fizzbuzz(15)
