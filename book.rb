class Book
  attr_accessor :rentals

  def initialize(title, author)
    @rentals = []
    @title = title
    @author = author
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end
end
