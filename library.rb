class Library
  include CreateFunctions
  attr_accessor :book_list, :people, :rentals

  def initialize
    @book_list = []
    @people = []
    @rentals = []
  end

  def check_empty(list, list_name, option)
    if list.empty?
      puts "#{list_name} list is empty, try adding a new value by selecting number #{option}"
    end
  end

  def list_books
    check_empty(@book_list, 'Books', '4')

    @book_list.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
    puts ''
  end

  def list_people
    check_empty(@people, 'People', '3')

    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}. ID: #{person.id}, Age: #{person.age}"
    end
    puts ''
  end

  def create_rental
    check_empty(@book_list, 'Books', '4')

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
    check_empty(@rentals, 'Rentals', '6')

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
