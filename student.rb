require_relative 'person'

class Student < Person
  attr_accessor :name, :age, :parent_permission
  attr_reader :classroom

  def initialize(classroom, age, name, parent_permission)
    super(age, name, parent_permission)
    @classroom = classroom
    @id = Random.rand(1..1000)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
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

  def play_hookey
    '¯\(ツ)/¯'
  end
end

# require_relative 'person'

# class Student < Person
#   def initialize(classroom, age, name, parent_permission)
#     super(age, name, parent_permission)
#     @classroom = classroom
#     @id = Random.rand(1..1000)
#   end

#   attr_accessor :name, :age, :parent_permission

#   attr_reader :classroom

#   def classroom=(classroom)
#     @classroom = classroom
#     classroom.students << self unless classroom.students.include?(self)
#   end

#   def play_hookey
#     '¯\(ツ)/¯'
#   end

#   def print_class
#     @classroom
#   end

#   def student_id
#     @id
#   end

#   def student_id=(id)
#     @id = id
#   end

#   def can_use_services?
#     @parent_permission || of_age?
#   end

#   private

#   def of_age?
#     @age >= 18
#   end

#   def play_hooky
#     '¯(ツ)/¯'
#   end
# end
