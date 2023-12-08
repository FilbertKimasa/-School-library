# person_spec.rb

require_relative '../person'
require_relative '../rental'
require_relative '../book'
require 'rspec'

RSpec.describe Person do
  let(:person_name) { 'John Doe' }
  let(:person_age) { 25 }
  let(:parent_permission) { true }

  let(:book_title) { 'The Great Gatsby' }
  let(:book_author) { 'F. Scott Fitzgerald' }
  let(:book) { Book.new(book_title, book_author) }

  describe '#initialize' do
    it 'creates a person with the specified age, name, and parent permission' do
      person = Person.new(person_age, parent_permission: parent_permission, name: person_name)

      expect(person.age).to eq(person_age)
      expect(person.name).to eq(person_name)
      expect(person.instance_variable_get(:@parent_permission)).to eq(parent_permission)
      expect(person.rentals).to be_empty
    end
  end

  describe '#can_use_services?' do
    it 'returns true if the person is of age' do
      person = Person.new(20)
      expect(person.can_use_services?).to be(true)
    end

    it 'returns true if the person has parent permission' do
      person = Person.new(15, parent_permission: true)
      expect(person.can_use_services?).to be(true)
    end

    it 'returns false if the person is not of age and has no parent permission' do
      person = Person.new(15, parent_permission: false)
      expect(person.can_use_services?).to be(false)
    end
  end

  describe '#correct_name' do
    it 'returns the correct name' do
      person = Person.new(person_age, name: person_name)
      expect(person.correct_name).to eq(person_name)
    end
  end

  describe '#add_rental' do
    it 'creates a new rental associated with the person and book' do
      person = Person.new(person_age, name: person_name)
      rental_date = '2023-12-07'

      rental = person.add_rental(book, rental_date)

      expect(rental).to be_a(Rental)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
      expect(person.rentals).to include(rental)
    end
  end
end
