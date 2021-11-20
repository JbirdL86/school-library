class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @author = author
    @title = title
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
  end
end
