class FileSaver
  def initialize(books, people, rentals)
    @books = books
    @people = people
    @rentals = rentals
  end

  def save_books
    serialized_books = @books.map do |book|
      {
        title: book.title,
        author: book.author
      }
    end
    file_content = serialized_books.map { |book| JSON.generate(book) }.join(",\n")
    file = File.open('books.json', 'w')
    file.puts("[\n#{file_content}\n]")
    file.close
  end

  def save_people
    serialized_people = @people.map do |person|
      attributes = {
        name: person.name,
        age: person.age,
        id: person.id
      }
      if person.is_a? Student
        attributes[:parent_permission] = person.parent_permission
      elsif person.is_a? Teacher
        attributes[:specialization] = person.specialization
      end
      attributes
    end
    file_content = serialized_people.map { |person| JSON.generate(person) }.join(",\n")
    file = File.open('people.json', 'w')
    file.puts("[\n#{file_content}\n]")
    file.close
  end

  def save_rentals
    serialized_rentals = @rentals.map do |rental|
      {
        date: rental.date,
        book: rental.book.title,
        person: rental.person.name
      }
    end
    file_content = serialized_rentals.map { |rental| JSON.generate(rental) }.join(",\n")
    file = File.open('rentals.json', 'w')
    file.puts("[\n#{file_content}\n]")
    file.close
  end

  # def save_books
  #   serialized_books = @books.map do |book|
  #     {
  #       title: book.title,
  #       author: book.author
  #     }
  #   end
  #   file_content = "[\n" + serialized_books.map { |book| JSON.generate(book) }.join(",\n") + "\n]"
  #   file = File.open('books.json', 'w')
  #   file.puts(file_content)
  #   file.close
  # end

  # def save_people
  #   serialized_people = @people.map do |person|
  #     attributes = {
  #       name: person.name,
  #       age: person.age,
  #       id: person.id
  #     }
  #     if person.is_a? Student
  #       attributes[:parent_permission] = person.parent_permission
  #     elsif person.is_a? Teacher
  #       attributes[:specialization] = person.specialization
  #     end
  #     attributes
  #   end
  #   file_content = "[\n" + serialized_people.map { |person| JSON.generate(person) }.join(",\n") + "\n]"
  #   file = File.open('people.json', 'w')
  #   file.puts(file_content)
  #   file.close
  # end

  # def save_rentals
  #   serialized_rentals = @rentals.map do |rental|
  #     {
  #       date: rental.date,
  #       book: rental.book.title,
  #       person: rental.person.name
  #     }
  #   end
  #   file_content = "[\n" + serialized_rentals.map { |rental| JSON.generate(rental) }.join(",\n") + "\n]"
  #   file = File.open('rentals.json', 'w')
  #   file.puts(file_content)
  #   file.close
  # end

  def list_people_ids
    if @people.empty?
      puts 'No people found'
    else
      @people.each do |person|
        name = person.name
        age = person.age
        id = person.id
        grp = person.class
        puts "[#{grp}] - Name: #{name}, ID: #{id}, Age: #{age}]"
      end
    end
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
    if @people.empty?
      puts 'No people found'
    else
      puts '----------------------------------------------'
      puts '-------List of people are as follows:---------'
      @people.each_with_index do |person, index|
        if person.is_a?(Student)
          type = 'Student'
          info = "Name: #{person.name}, Age: #{person.age}, ID: #{person.id}, " \
                 "Parent Permission: #{person.parent_permission}"
        elsif person.is_a?(Teacher)
          type = 'Teacher'
          info = "Name: #{person.name}, Age: #{person.age}, ID: #{person.id}, " \
                 "Specialization: #{person.specialization}"
        end
        puts "[#{type}] - #{index}) - #{info}"
      end
    end
  end

  def list_all_rentals
    if @rentals.empty?
      puts 'No rentals found'
    else
      puts '----------------------------------------------'
      puts '---------list of rentals are as follows:---------'
      @rentals.each_with_index do |rental, index|
        if rental
          puts "#{index}) - Borrowed Date: #{rental.date}, Book borrowed: #{rental.book.title}, " \
               "Borrower: #{rental.person.name}, Designation: #{rental.person.class}"
        else
          puts 'No rentals found'
        end
      end
    end
  end

  def list_all_rentals_for_a_given_person_id
    list_people_ids
    puts 'Please enter the ID of the person'
    person_id = gets.chomp.to_i
    person = @people.find { |pers| pers.id == person_id }
    if person
      puts "---------list of rentals for ID of #{person_id} are as follows:---------"
      person.rentals.each_with_index do |rental, index|
        puts "#{index}) - Borrowed Date: #{rental.date},  " \
             "Borrower: #{rental.person.name}, Book borrowed: #{rental.book.title}"
      end
    else
      puts 'rental not found for the chosen id'
    end
  end
end
