# spec/book_spec.rb
require_relative '../book'
require_relative '../rental'

RSpec.describe Book do
  let(:book_title) { 'The Great Gatsby' }
  let(:author_name) { 'F. Scott Fitzgerald' }
  let(:book) { Book.new(book_title, author_name) }
  let(:person) { double('Person', rentals: []) } # Add the rentals attribute

  describe '#add_rental' do
    it 'creates a new rental and associates it with the book and person' do
      rental_date = '2023-12-07'
      rental = book.add_rental(person, rental_date)

      expect(rental).to be_a(Rental)
      expect(rental.date).to eq(rental_date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end

    it 'adds the rental to the book rentals array' do
      rental_date = '2023-12-07'
      book.add_rental(person, rental_date)

      expect(book.rentals.length).to eq(1)
      expect(book.rentals.first).to be_a(Rental)
    end
  end
end
