require 'rspec'
require '../person.rb'
require '../book.rb'

describe Person do
  let(:age) { 20 }
  let(:name) { 'John Doe' }
  let(:parent_permission) { true }
  let(:person) { Person.new(age, name, parent_permission) }
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:date) { '2023-06-28' }

  describe '#initialize' do
    it 'creates a new person with the given age, name, and parent permission' do
      expect(person.age).to eq(age)
      expect(person.name).to eq(name)
      expect(person.parent_permission).to eq(parent_permission)
      expect(person.rentals).to be_an(Array)
      expect(person.rentals).to be_empty
    end

    it 'generates a random ID for the person' do
      expect(person.id).to be_an(Integer)
    end
  end

  describe '#can_use_services?' do
    context 'when the person has parent permission' do
      it 'returns true' do
        expect(person.can_use_services?).to be true
      end
    end

    context 'when the person is of age' do
      let(:parent_permission) { false }

      it 'returns true' do
        expect(person.can_use_services?).to be true
      end
    end

  end

  describe '#add_rental' do
    it 'creates a new rental for the person with the given book and date' do
      rental = person.add_rental(book, date)
      expect(rental).to be_a(Rental)
      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
      expect(person.rentals).to include(rental)
    end
  end
end
