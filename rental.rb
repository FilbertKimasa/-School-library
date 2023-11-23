class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    # Add the rental to the book's rentals and the person's rentals
    book.rentals << self
    person.rentals << self
  end
end