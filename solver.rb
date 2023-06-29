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

# we use this.factorial because we are not calling the method on the instance of the class
# we are calling it on the class itself
# which means we don't need to create an instance of the class to call the method
# we can just call the method directly on the class
# this is called a class method
# we can also call the method on an instance of the class
# this is called an instance method
