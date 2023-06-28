class FileLoader
  def load_books
    if File.exist?('books.json')
      file = File.read('books.json')
      data = JSON.parse(file)
      result = []
      data.each do |book|
        result << Book.new(book['title'], book['author'])
      end
    else
      result = []
    end
    result
  end

  def load_people
    if File.exist?('people.json')
      file = File.read('people.json')
      data = JSON.parse(file)
      result = []
      data.each do |person|
        result << if person.key?('parent_permission')
                    Student.new(nil, person['age'], person['name'], person['parent_permission'])
                  else
                    Teacher.new(person['specialization'], person['age'], person['name'])
                  end
      end
    else
      result = []
    end
    result
  end

  def load_rentals(books, people)
    result = []

    return result unless File.exist?('rentals.json')

    file = File.read('rentals.json')
    data = JSON.parse(file)

    data.each do |rental|
      book_title = rental['book']
      person_name = rental['person']

      book = books.find { |bk| bk.title == book_title }
      person = people.find { |pple| pple.name == person_name }

      if book && person
        result << Rental.new(rental['date'], book, person)
      else
        log_missing_entities(rental, book, person)
      end
    end

    result
  end

  def log_missing_entities(rental, book, person)
    puts "Book not found for rental: #{rental.inspect}" unless book
    puts "Person not found for rental: #{rental.inspect}" unless person
  end

  # def load_rentals(first, second)
  #   if File.exist?('rentals.json')
  #     file = File.read('rentals.json')
  #     data = JSON.parse(file)
  #     result = []
  #     data.each do |rental|
  #       book = first.find { |bk| bk.title == rental['book'] }
  #       person = second.find { |pple| pple.name == rental['person'] }
  #       puts "Book not found for rental: #{rental.inspect}" if book.nil?
  #       puts "Person not found for rental: #{rental.inspect}" if person.nil?
  #       result << Rental.new(rental['date'], book, person) if book && person
  #     end
  #   else
  #     result = []
  #   end
  #   result
  # end
end
