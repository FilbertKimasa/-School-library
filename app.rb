require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'classroom'

class App
  attr_accessor :people, :books, :rentals, :classrooms

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    puts 'List of Books:'
    @books.each { |book| puts "#{book.title} by #{book.author}" }
  end

  def list_people
    puts 'List of People:'
    @people.each { |person| puts "#{person.name} (ID: #{person.id})" }
  end

  def create_person(name, age, type)
    if type == 'teacher'
      teacher = Teacher.new(nil, age, name: name)
      @people << teacher
      puts "#{teacher.name} (Teacher) created with ID: #{teacher.id}"
    elsif type == 'student'
      student = Student.new(nil, age, name: name)
      @people << student
      puts "#{student.name} (Student) created with ID: #{student.id}"
    else
      puts "Invalid person type. Please specify 'teacher' or 'student'."
    end
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts "Book '#{book.title}' by #{book.author} created."
  end

  def create_rental(person_id, book_title, due_date)
    person = @people.find { |p| p.id == person_id }
    book = @books.find { |b| b.title == book_title }

    if person && book
      rental = Rental.new(due_date, book, person)
      @rentals << rental
      puts "Rental created: #{person.name} rented '#{book.title}' (Due Date: #{rental.date})"
    else
      puts 'Person or book not found. Please check the person ID and book title.'
    end
  end


  def list_rentals_for_person(person_id)
    person = @people.find { |p| p.id == person_id }

    if person
      puts "Rentals for #{person.name}:"
      person.rentals.each { |rental| puts "'#{rental.book.title}' - Due Date: #{rental.date}" }
    else
      puts 'Person not found. Please check the person ID.'
    end
  end
end
