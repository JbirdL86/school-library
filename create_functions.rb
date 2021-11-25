require_relative 'teacher'
require_relative 'student'
require_relative 'book'

module CreateFunctions
  def create_person
    ids = (1...100).to_a.shuffle
    person = nil
    person_type = nil

    while person_type != 1 && person_type != 2
      puts 'Do you want to create a student (1) or a teacher (2)?: [Input the number]'
      person_type = gets.chomp.to_i

      case person_type
      when 1
        input = nil
        permission = nil

        print 'Name: '
        name = gets.chomp

        print 'Age: '
        age = gets.chomp

        while input != 'y' && input != 'n'
          print 'Has parent permission? [Y/N]: '
          input = gets.chomp.downcase
          case input
          when 'y'
            permission = true
          when 'n'
            permission = false
          else
            puts 'Wrong input! Please try type Y/y for yes or N/n for no:'
          end
        end
        puts 'test'
        person = Student.new(ids.pop, age, name, permission)
        person.validate_name
        puts 'Person created successfully!'
        puts ''
      when 2
        print 'Name: '
        name = gets.chomp

        print 'Age: '
        age = gets.chomp

        print 'Specialization: '
        specialization = gets.chomp
        person = Teacher.new(ids.pop, age, specialization, name)
        person.validate_name
        puts 'Person created successfully!'
        puts ''
      else
        puts 'Wrong data! Please try typing 1 for a student or 2 for teacher'
      end
    end
    person
  end

  def create_book
    ids = (1...100).to_a.shuffle
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(ids.pop, title, author)
    puts 'Book created successfully!'
    book
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
end
