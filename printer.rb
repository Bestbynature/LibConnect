class Printer
  def print_options
    puts '----------------------------------------------'
    puts 'Welcome to the School Library App'
    puts 'Please choose an option below:'
    OPTIONS.each { |key, option| puts "#{key}. #{option}" }
    puts '----------------------------------------------'
  end
end
