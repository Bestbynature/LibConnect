require_relative 'book'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'
require 'json'

def load_data_from_file
  @books = load_json_file('books.json').map do |book_data|
    book_hash = JSON.parse(book_data)
    Book.new(book_hash['title'], book_hash['author'])
  end

  @people = load_json_file('people.json').map do |person_data|
    person_hash = JSON.parse(person_data)
    if person_hash.key?('parent_permission')
      Student.new(nil, person_hash['age'], person_hash['name'], person_hash['parent_permission'])
    else
      Teacher.new(person_hash['specialization'], person_hash['age'], person_hash['name'])
    end
  end

  @rentals = load_json_file('rentals.json').map do |rental_data|
    rental_hash = JSON.parse(rental_data)
    book_obj = find_book_by_title(rental_hash['book_title'])
    person_obj = find_person_by_id(rental_hash['person_id'])
    Rental.new(rental_hash['date'], book_obj, person_obj)
  end
end

def load_json_file(filename)
  if File.exist?(filename)
    json_data = File.read(filename)
    JSON.parse(json_data)
  else
    []
  end
end

def find_book_by_title(title)
  @books.find { |book| book.title == title }
end

def find_person_by_id(id)
  id = id.to_i
  @people.find { |person| person.id == id }
end

def save_data_to_file
    data = {
      books: @books.map(&:to_json),
      people: @people.map(&:to_json),
      rentals: @rentals.reject(&:nil?).map(&:to_json)
    }
  
    File.write('books.json', JSON.pretty_generate(data[:books]))
  
    File.write('people.json', JSON.pretty_generate(data[:people]))
  
    File.write('rentals.json', JSON.pretty_generate(data[:rentals]))
  end
  
