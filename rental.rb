class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    book.rentals << self
    person.rentals << self
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end
