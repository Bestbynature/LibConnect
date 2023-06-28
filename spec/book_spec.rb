require 'rspec'
require '../book.rb'

describe Book do
  let(:title) { 'The Great Gatsby' }
  let(:author) { 'F. Scott Fitzgerald' }
  let(:book) { Book.new(title, author) }
  let(:rental) { double('rental') }

  describe '#initialize' do
    it 'creates a new book with the given title and author' do
      expect(book.title).to eq(title)
      expect(book.author).to eq(author)
    end

    it 'initializes the rentals array' do
      expect(book.rentals).to be_an(Array)
      expect(book.rentals).to be_empty
    end
  end

  describe '#add_rental' do
    it 'adds a rental to the rentals array' do
      expect {
        book.add_rental(rental)
      }.to change { book.rentals.length }.by(1)
      expect(book.rentals).to include(rental)
    end
  end
end
