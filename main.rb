require_relative 'person'
require_relative 'capitalizeDecorator'
require_relative 'trimDecorator'

person = Person.new(22, name: 'maximilianus')
person.correct_name
capitalized_person = Capitalize_decorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = Trim_ecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
