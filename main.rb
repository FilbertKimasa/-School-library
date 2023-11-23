require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'capitalize_decorator'
require_relative 'trim_decorator'

person = Person.new(22, name: 'maximilianus')
puts person.correct_name

# Appliying decorators
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name

person = Person.new(20, name: 'John Doe')
book = Book.new('Ruby Programming', 'John Smith')

# Create a rental and associate it with the person and book
rental = Rental.new('2023-11-21', book, person)

# Output information
puts "Person: #{person.name}, Age: #{person.age}"
puts "Book: #{book.title}, Author: #{book.author}"
puts "Rental Date: #{rental.date}"
