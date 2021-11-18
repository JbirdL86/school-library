class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @author = author
    @title = title
    private
    @rentals = []
  end

  def add_rental(date, person)
    rental = Rental.new(date, self, person)
    @rentals.push(rental)
  end
end
