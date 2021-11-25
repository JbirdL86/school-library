class Book
  attr_accessor :title, :author, :id, :rentals

  def initialize(id, title, author)
    @id = id
    @author = author
    @title = title
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
  end
end
