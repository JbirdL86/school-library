require_relative 'create_functions'
require_relative 'rental'
require_relative 'library'

def main
  app = Library.new
  option = nil
  puts 'Welcome To School Library App'

  while option != '7'

    puts 'Please choose an option by entering a number:'
    puts '1 = List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 = Create a book'
    puts '5 - Create a rental'
    puts '6 = List all rentals for a given person id'
    puts '7 = Exit'

    option = gets.chomp.to_i

    case option
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      app.people.push(app.create_person)
    when 4
      app.book_list.push(app.create_book)
    when 5
      app.create_rental
    when 6
      app.list_rentals
    when 7
      app.save_data
      puts 'Thank you for using the School Library App'
      break
    else
      puts 'Wrong input! Please enter a valid option between 1 and 7'
    end
    puts ''
  end
end

main
