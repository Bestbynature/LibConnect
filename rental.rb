class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    @person.add_rental(self) if @person
  @book.add_rental(self) if @book

  @book.rentals << self if @book
  @person.rentals << self if @person
    # person.add_rental(self)
    # book.add_rental(self)
    # book.rentals << self
    # person.rentals << self
  end

  def to_json(*args)
    {
      date: @date,
      book_title: @book.title,
      person_id: @person.id
    }.to_json(*args)
  end
end
