require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'file_operations'
require 'json'

class App
  def initialize
    load_data_from_file
  end

  def list_all_books
    if @books.empty?
      puts 'No book found'
    else
      puts '----------------------------------------------'
      puts '---------list of books are as follows:---------'
      @books.each_with_index do |book, index|
        puts "#{index}) - Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_all_people
    puts '----------------------------------------------'
    puts '-------List of people are as follows:---------'
    @people.each_with_index do |person, index|
      if person.is_a? Student
        name = person.name
        age = person.age
        id = person.id
        par_perm = person.parent_permission
        grp = person.class
        puts "[#{grp}] - #{index}) - Name: #{name}, Age: #{age}, ID: #{id}, Parent Permission: #{par_perm}"
      elsif person.is_a? Teacher
        grp = person.class
        name = person.name
        age = person.age
        id = person.id
        spec = person.specialization
        puts "[#{grp}] - #{index}) - Name: #{name}, Age: #{age}, ID: #{id}, Specialization: #{spec}"
      end
    end
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
    save_data_to_file
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
    save_data_to_file
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
    book = select_book
    person = select_person
    date = retrieve_date

    rental = Rental.new(date, book, person)
    @rentals.push(rental)

    puts '-------------------------------------'
    puts 'Rental created successfully'
    puts '-------------------------------------'
    save_data_to_file
  end

  def select_book
    puts 'Select a book from the following list by number'
    list_all_books
    book_id = gets.chomp.to_i
    @books[book_id]
  end

  def select_person
    puts 'Select a person from the following list by number'
    list_all_people
    person_id = gets.chomp.to_i
    @people[person_id]
  end

  def retrieve_date
    puts 'Date: in this format => yyyy/mm/dd'
    gets.chomp
  end

  def list_all_rentals
    puts '----------------------------------------------'
    puts '---------list of rentals are as follows:---------'
    @rentals.each_with_index do |rental, index|
      if rental
      puts "#{index}) - Borrowed Date: #{rental.date}, Book borrowed: #{rental.book.title}, Borrower: #{rental.person.name} Designation: #{rental.person.class}"
      end
    end
  end

  def list_all_rentals_for_a_given_person_id
    person_id = retrieve_person_id
    person = find_person_by_id(person_id)

    if person
      puts '---------list of rentals are as follows:---------'
      display_rentals(person.rentals)
    else
      puts 'Person not found'
    end
  end

  def retrieve_person_id
    puts 'Please enter the ID of the person'
    gets.chomp.to_i
  end

  def find_person_by_id(person_id)
    @people.find { |person| person.id == person_id }
  end

  def display_rentals(rentals)
    rentals.each_with_index do |rental, index|
      puts "#{index}) - Borrowed Date: #{rental.date}, Book borrowed: #{rental.book.title}"
    end
  end
end
