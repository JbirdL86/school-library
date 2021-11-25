class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    puts person
    puts book
    person.add_rental(self)
    book.add_rental(self)
  end
end
