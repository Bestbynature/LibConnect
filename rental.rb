class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    book.rentals << self if book.respond_to?(:rentals)
    person.rentals << self if person.respond_to?(:rentals)
  end
end
