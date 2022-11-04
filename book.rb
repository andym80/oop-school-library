class Book
  attr_accessor :rentals, :title, :author

  def initialize(title, author)
    @rentals = []
    @title = title
    @author = author
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end
end
