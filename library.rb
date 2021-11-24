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
    peopleData = []
    data_array.each do |data, index|
      peopleData.push({Class: data.class, Name: data.name, ID: data.id, Age: data.age})
    end
    return JSON.generate(peopleData)
  end

  def parse_book_json(data_array)
    bookData = []
    data_array.each do |data, index|
      bookData.push({Title: data.title, Author: data.author})
    end
    return JSON.generate(bookData)
  end

  def read_people()
    return [] if !File.exists?('person.json')
    file = File.open('person.json')
    file_data = file.read if file
    people_data = JSON.parse(file_data)
    people = []
    people_data.each do |data, index|
      people.push(Student.new(data['ID'], data['Age'], data['Name']))
    end
    @people = people
  end

  def read_books()
    return [] if !File.exists?('books.json')
    file = File.open('books.json')
    file_data = file.read if file
    books_data = JSON.parse(file_data)
    books = []
    books_data.each do |data, index|
      books.push(Book.new(data['Title'], data['Author']))
    end
    @book_list = books
  end

  def save_data
    if @people.length > 0 
      File.open('person.json', 'w+') { |f| f.write(parse_people_json(@people)) }
    end
    if @book_list.length > 0 
      File.open('books.json', 'w+') { |f| f.write(parse_book_json(@book_list)) }
    end
  end
end
