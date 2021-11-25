require_relative 'create_functions'
require 'json'
require_relative 'student'
require_relative 'book'

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

  def parse_people_json(data_array)
    people_data = []
    rental_data = []
    data_array.each do |data|
      data.rentals.each do |rental|
        rental_data.push({ Date: rental.date, BookId: rental.book.id, PersonId: rental.person.id })
      end
      case data.class.to_s
      when 'Student'
        people_data.push({ Class: data.class, Name: data.name, ID: data.id, Age: data.age, Rentals: rental_data })
      when 'Teacher'
        people_data.push({ Class: data.class, Name: data.name, ID: data.id, Age: data.age,
                           Specialization: data.specialization, Rentals: rental_data })
      end
      rental_data = []
    end
    JSON.generate(people_data)
  end

  def parse_book_json(data_array)
    book_data = []
    rental_data = []
    data_array.each do |data|
      data.rentals.each do |rental|
        rental_data.push({ Date: rental.date, BookId: rental.book.id, PersonId: rental.person.id })
      end
      book_data.push({ Title: data.title, Author: data.author, ID: data.id, Rentals: rental_data })
      rental_data = []
    end
    JSON.generate(book_data)
  end

  def parse_rental_json(data_array)
    rental_data = []
    data_array.each do |data|
      rental_data.push({ Date: data.date, BookId: data.book.id, PersonId: data.person.id })
    end
    JSON.generate(rental_data)
  end

  def read_people()
    return [] unless File.exist?('person.json')

    file = File.open('person.json')
    file_data = file.read if file
    people_data = JSON.parse(file_data)
    people = []
    people_data.each do |data, _index|
      case data['Class']
      when 'Student'
        people.push(Student.new(data['ID'], data['Age'], data['Name']))
      when 'Teacher'
        people.push(Teacher.new(data['ID'], data['Age'], data['Specialization'], data['Name']))
      end
    end
    @people = people
  end

  def read_books()
    return [] unless File.exist?('books.json')

    file = File.open('books.json')
    file_data = file.read if file
    books_data = JSON.parse(file_data)
    books = []
    books_data.each do |data, _index|
      books.push(Book.new(data['ID'], data['Title'], data['Author']))
    end
    @book_list = books
  end

  def read_rentals()
    return [] unless File.exist?('rentals.json')

    file = File.open('rentals.json')
    file_data = file.read if file
    rentals_data = JSON.parse(file_data)
    rentals = []
    rentals_data.each do |data|
      rental_book = @book_list.find { |book| book.id == data['BookId'] }
      rental_person = @people.find { |person| person.id == data['PersonId'] }
      rentals.push(Rental.new(data['Date'], rental_book, rental_person))
    end
    @rentals = rentals
  end

  def save_data
    if @people.!empty?
      File.open('person.json', 'w+') { |f| f.write(parse_people_json(@people)) }
    end
    if @book_list.!empty?
      File.open('books.json', 'w+') { |f| f.write(parse_book_json(@book_list)) }
    end
    if @rentals.!empty?
      File.open('rentals.json', 'w+') { |f| f.write(parse_rental_json(@rentals)) }
    end
  end
end
