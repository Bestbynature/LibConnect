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
