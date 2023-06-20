class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  # add a rental to the book's list of rentals
  def add_rental(rental)
    @rentals.push(rental)
  end

  # def add_rental(book, date)
  #   Rental.new(date, book, self)
  # end
end
