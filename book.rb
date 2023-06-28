class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  # def to_json(options = {})
  #   {
  #     title: @title,
  #     author: @author
  #   }.to_json(options)
  # end

  # add a rental to the book's list of rentals
  def add_rental(rental)
    @rentals.push(rental)
  end
end
