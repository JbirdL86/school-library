class Book
  attr_accessor :title, :author, :id, :rentals

  @@ids = (1...100).to_a.shuffle

  def initialize(title, author)
    @id = @@ids.pop
    @author = author
    @title = title
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
  end
end
