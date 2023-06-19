require_relative 'nameable'

class Person < Nameable
  attr_accessor :rentals, :age, :name, :parent_permission
  attr_reader :id

  def initialize(age, name = 'unknown', parent_permission: true)
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

  def add_rental(person, date)
    Rental.new(date, self, person)
  end

  private

  def of_age?
    @age >= 18
  end
end
