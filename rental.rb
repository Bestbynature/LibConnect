class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    person.add_rental(self)
    book.add_rental(self)
    book.rentals << self
    person.rentals << self
  end
end
