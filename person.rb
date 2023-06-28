require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  attr_accessor :rentals, :age, :name, :parent_permission
  attr_reader :id

  def initialize(age, name, parent_permission)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    @parent_permission || of_age?
  end

  def correct_name
    @name
  end

  # add a rental to the person's list of rentals
  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end
