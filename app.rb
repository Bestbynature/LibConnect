require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # list all books with their title and author as well as index. give a message if no book is found
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

  # list all people and show whether they are student or
  # teacher with their respective index as well as name, age
  # and id, if they are student but add specialization if they are teachers
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

  # prompt user for person details based on the type
  def create_a_person
    puts 'Name of the person:'
    name = gets.chomp
    puts 'Age of the person:'
    age = gets.chomp.to_i
    puts 'Type of person: choose 1 for Student or 2 for Teacher'
    type = gets.chomp.to_i
    if type == 1
      puts 'Has parent permission? (Y/N)'
      parent_permission = gets.chomp.upcase == 'Y'
      person = Student.new(nil, age, name, parent_permission)
    elsif type == 2
      puts 'Specialization:'
      specialization = gets.chomp
      person = Teacher.new(specialization, age, name)
    end
    @people.push(person)
    puts '-------------------------------------'
    puts 'Person added successfully'
    puts '-------------------------------------'
  end

  # prompt user for book details
  def create_a_book
    puts 'Title of the book:'
    title = gets.chomp
    puts 'Author of the book:'
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts '-------------------------------------'
    puts 'Book added successfully'
    puts '-------------------------------------'
  end

  # prompt user to select a person and a book from the list and create a rental
  def create_a_rental
    puts 'Select a book from the following list by number'
    list_all_books
    book_id = gets.chomp.to_i
    book = @books[book_id]
    puts 'Select a person from the following list by number'
    list_all_people
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

  # list all rentals with their date, book title and person name and index
  def list_all_rentals
    puts '----------------------------------------------'
    puts '---------list of rentals are as follows:---------'
    @rentals.each_with_index do |rental, index|
      puts "#{index}) - Borrowed Date: #{rental.date}, Book borrowed: #{rental.book.title},
      Borrower: #{rental.person.name} Designation: #{rental.person.class}"
    end
  end

  # list all rentals for a given person.id not the index of the array
  def list_all_rentals_for_a_given_person_id
    puts 'Please enter the ID of the person'
    list_all_people
    person_id = gets.chomp.to_i
    person = @people.find { |p| p.id == person_id }

    if person
      puts '---------list of rentals are as follows:---------'
      person.rentals.each_with_index do |rental, index|
        puts "#{index}) - Borrowed Date: #{rental.date}, Book borrowed: #{rental.book.title}"
      end
    else
      puts 'Person not found'
    end
  end
end
