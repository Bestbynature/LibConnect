require_relative '../rental'
require_relative '../book'
require_relative '../person'

RSpec.describe Rental do
  let(:book) { Book.new('Title', 'Author') }
  let(:person) { Person.new(20, 'John', true) }
  let(:date) { '2023-06-28' }
  let(:rental) { Rental.new(date, book, person) }

  describe '#date' do
    it 'returns the rental date' do
      expect(rental.date).to eq(date)
    end
  end

  describe '#book' do
    it 'returns the rented book' do
      expect(rental.book).to eq(book)
    end
  end

  describe '#person' do
    it 'returns the person who rented the book' do
      expect(rental.person).to eq(person)
    end
  end

  describe 'book rentals' do
    it 'adds the rental to the book' do
      expect(book.rentals).to include(rental)
    end
  end

  describe 'person rentals' do
    it 'adds the rental to the person' do
      expect(person.rentals).to include(rental)
    end
  end
end
