require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  