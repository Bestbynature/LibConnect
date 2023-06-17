require_relative 'person'

class Student < Person
  def initialize(age, classroom, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
    @id = Random.rand(1..1000)
  end

  def play_hookey
    '¯\(ツ)/¯'
  end

  attr_accessor :classroom, :name, :age, :parent_permission

  def print_class
    @classroom
  end

  def student_id
    @id
  end

  def student_id=(id)
    @id = id
  end

  def can_use_services?
    @parent_permission || of_age?
  end

  private

  def of_age?
    @age >= 18
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
