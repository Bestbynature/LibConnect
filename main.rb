require_relative 'app'

OPTIONS = {
  1 => 'List all books',
  2 => 'List all people',
  3 => 'Create a person',
  4 => 'Create a book',
  5 => 'Create a rental',
  6 => 'List all rentals for a given person id',
  7 => 'List all rentals',
  8 => 'Exit'
}.freeze

def print_options
  puts '----------------------------------------------'
  puts 'Welcome to the School Library App'
  puts 'Please choose an option below:'
  OPTIONS.each { |key, option| puts "#{key}. #{option}" }
  puts '----------------------------------------------'
end

def main
  app = App.new

  loop do
    print_options
    option = gets.chomp.to_i

    case option
    when 1..7
      app.send(OPTIONS[option].downcase.gsub(/\s+/, '_'))
    when 8
      puts 'Thank you for using this app. Goodbye!'
      break
    else
      puts 'Invalid option. Please try again.'
    end
  end
end

main
