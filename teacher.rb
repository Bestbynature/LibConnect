require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  # def to_json(*args)
  #   {
  #     type: 'teacher',
  #     specialization: @specialization,
  #     age: @age,
  #     name: @name,
  #     id: @id
  #   }.to_json(*args)
  # end

  def can_use_services?
    true
  end
end
