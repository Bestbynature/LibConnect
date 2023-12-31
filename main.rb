require_relative 'app'
require_relative 'printer'

# The list of options to be displayed to let user choose one
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

def main
  app = App.new

  loop do
    printer = Printer.new
    printer.print_options
    option = gets.chomp.to_i

    case option
    when 1..7
      # call the function selected from the list from app object
      app.send(OPTIONS[option].downcase.gsub(/\s+/, '_'))
    when 8
      # display a message and exit the application
      app.save_all_data
      puts 'Thank you for using this app. Goodbye!'
      break
    else
      # display an invalid option message
      puts 'Invalid option. Please try again.'
    end
  end
end

main
