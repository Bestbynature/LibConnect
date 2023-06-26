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
    name = get_name
    age = get_age
    type = get_person_type
  
    case type
    when 1
      parent_permission = get_parent_permission
      person = Student.new(nil, age, name, parent_permission)
    when 2
      specialization = get_specialization
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
  
  def get_name
    puts 'Name of the person:'
    gets.chomp
  end
  
  def get_age
    puts 'Age of the person:'
    gets.chomp.to_i
  end
  
  def get_person_type
    puts 'Type of person: choose 1 for Student or 2 for Teacher'
    gets.chomp.to_i
  end
  
  def get_parent_permission
    puts 'Has parent permission? (Y/N)'
    gets.chomp.upcase == 'Y'
  end
  
  def get_specialization
    puts 'Specialization:'
    gets.chomp
  end
  

  # prompt user for book details
  def create_a_book
    title = get_title
    author = get_author
    book = Book.new(title, author)
    @books.push(book)
    puts '-------------------------------------'
    puts 'Book added successfully'
    puts '-------------------------------------'
  end
  
  def get_title
    puts 'Title of the book:'
    gets.chomp
  end
  
  def get_author
    puts 'Author of the book:'
    gets.chomp
  end
  

  # prompt user to select a person and a book from the list and create a rental
  def create_a_rental
    book = select_book
    person = select_person
    date = get_date
  
    rental = Rental.new(date, book, person)
    @rentals.push(rental)
  
    puts '-------------------------------------'
    puts 'Rental created successfully'
    puts '-------------------------------------'
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
  
  def get_date
    puts 'Date: in this format => yyyy/mm/dd'
    gets.chomp
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
    person_id = get_person_id
    person = find_person_by_id(person_id)
  
    if person
      puts '---------list of rentals are as follows:---------'
      display_rentals(person.rentals)
    else
      puts 'Person not found'
    end
  end
  
  def get_person_id
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
