require_relative 'create_functions'
require 'json'

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

  def parse_to_json(data_array)
    data_string = ''
    data_array.each do |data, index|
      data_string += "{#{data.class}, Name: #{data.name}, ID: #{data.id}, Age: #{data.age}}"
      if index <= data_array.length
        data_string += ', '
      end
    end
    json_data = JSON.generate(data_string)
    print json_data
    json_data
  end

  def save_data
    people_data = parse_to_json(@people)
    File.open('person.json', 'w+') { |f| f.write(people_data) } if !File.exist?('person.json')
    print File.directory?('person.json')
  end
end
