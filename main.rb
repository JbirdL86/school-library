# rubocop:disable Metrics\CyclomaticComplexity, Metrics/MethodLength

require_relative 'create_functions'
require_relative 'rental'

class App
  include CreateFunctions
  attr_accessor :book_list, :people, :rentals

  def initialize
    @book_list = []
    @people = []
    @rentals = []
  end

  def list_books
    if @book_list.empty?
      puts 'Books list is empty, try adding a new book by selecting number 4'
      return
    end

    @book_list.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
    puts ''
  end

  def list_people
    if @people.empty?
      puts 'People list is empty, try creating a new person by selecting number 3'
      return
    end

    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}. ID: #{person.id}, Age: #{person.age}"
    end
    puts ''
  end

  def create_rental
    if @book_list.empty?
      puts 'Book list is empty, try adding a book by entering number 4'
      return
    end

    puts 'Select a book from the following list by number:'
    @book_list.map do |book|
      puts "#{@book_list.index(book)}) Title: '#{book.title}', Author: '#{book.author}'"
    end

    print 'Book #: '
    book_selection = gets.chomp.to_i
    book = @book_list[book_selection]

    puts 'Select a person from the following list by number (not ID):'
    @people.map do |person|
      puts "#{@people.index(person)}) [#{person.class}] Name: #{person.name}. ID: #{person.id}, Age: #{person.age}"
    end

    print 'Person #: '
    person_selection = gets.chomp.to_i
    person = @people[person_selection]

    print 'Date: '
    date = gets.chomp.to_i

    rental = Rental.new(date, book, person)
    @rentals.push(rental)
    puts 'Rental created successfully'
  end

  def list_rentals
    if @rentals.empty?
      puts 'There are no rentals at the time, please try adding rentals by selecting number 6'
      return
    end

    puts 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rentals: '
    @people.each do |person|
      next if person.id != id

      person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}\n"
      end
    end
  end
end

def main
  app = App.new

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
      puts 'Thank you for using the School Library App'
      break
    else
      puts 'Wrong input! Please enter a valid option between 1 and 7'
    end
    puts ''
  end
end

main
# rubocop:enable Metrics\CyclomaticComplexity, Metrics/MethodLength
