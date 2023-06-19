class Nameable
  def correct_name
    raise NotImplementedError, 'Subclasses must implement this method'
  end
end

class BaseDecorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.upcase
  end
end

class TrimmerDecorator < BaseDecorator
  MAX_LENGTH = 10

  def correct_name
    name = @nameable.correct_name
    name.length > MAX_LENGTH ? name[0...MAX_LENGTH] : name
  end
end
