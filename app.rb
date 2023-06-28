require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'file_loader'
require_relative 'file_saver'
require 'json'

class App
  attr_accessor :books, :persons, :rentals

  def initialize
    @file_loader = FileLoader.new
    @books = @file_loader.load_books
    @people = @file_loader.load_people
    @rentals = @file_loader.load_rentals(@books, @people)
    @file_saver = FileSaver.new(@books, @people, @rentals)
  end

  def create_a_person
    name = retrieve_name
    age = retrieve_age
    type = retrieve_person_type

    case type
    when 1
      parent_permission = retrieve_parent_permission
      person = Student.new(nil, age, name, parent_permission)
    when 2
      specialization = retrieve_specialization
      person = Teacher.new(specialization, age, name)
    else
      puts 'Invalid person type.'
      return
    end

    @people.push(person)
    puts '-------------------------------------'
    puts 'Person added successfully'
    puts '-------------------------------------'
  end

  def retrieve_name
    puts 'Name of the person:'
    gets.chomp
  end

  def retrieve_age
    puts 'Age of the person:'
    gets.chomp.to_i
  end

  def retrieve_person_type
    puts 'Type of person: choose 1 for Student or 2 for Teacher'
    gets.chomp.to_i
  end

  def retrieve_parent_permission
    puts 'Has parent permission? (Y/N)'
    gets.chomp.upcase == 'Y'
  end

  def retrieve_specialization
    puts 'Specialization:'
    gets.chomp
  end

  def create_a_book
    title = retrieve_title
    author = retrieve_author
    book = Book.new(title, author)
    @books.push(book)
    puts '-------------------------------------'
    puts 'Book added successfully'
    puts '-------------------------------------'
  end

  def retrieve_title
    puts 'Title of the book:'
    gets.chomp
  end

  def retrieve_author
    puts 'Author of the book:'
    gets.chomp
  end

  def create_a_rental
    puts 'Select a book from the following list by number'
    @file_saver.list_all_books
    book_id = gets.chomp.to_i
    book = @books[book_id]
    puts 'Select a person from the following list by number'
    @file_saver.list_all_people
    person_id = gets.chomp.to_i
    person = @people[person_id]
    puts 'Date: in this format => yyyy/mm/dd'
    date = gets.chomp
    rental = Rental.new(date, book, person)
    @rentals.push(rental)
    puts '-------------------------------------'
    puts 'Rental created successfully'
    puts '-------------------------------------'
  end

  def list_all_books
    @file_saver.list_all_books
  end

  def list_all_people
    @file_saver.list_all_people
  end

  def list_all_rentals
    @file_saver.list_all_rentals
  end

  def list_all_rentals_for_a_given_person_id
    @file_saver.list_all_rentals_for_a_given_person_id
  end

  def save_all_data
    # file_saver = FileSaver.new(@books, @people, @rentals)
    @file_saver.save_books if @books.length.positive?
    @file_saver.save_people if @people.length.positive?
    @file_saver.save_rentals if @rentals.length.positive?
  end
end
