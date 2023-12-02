require 'date'
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

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp.to_i
    case person_type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid Option'
    end
  end

  def create_student
    print 'Enter Name: '
    name = gets.chomp
    print 'Enter Age: '
    age = gets.chomp
    print 'Has Parents permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    student = Student.new(nil, age, parent_permission: parent_permission, name: name)
    @people << student
    puts 'Person Created Successfully'
    puts ' '
  end

  def create_teacher
    print 'Enter Name: '
    name = gets.chomp
    print 'Enter Age: '
    age = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name: name)
    @people << teacher
    puts 'Person Created Successfully'
    puts ' '
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts 'Book Created Successfully'
  end

  def all_books(show_index: false)
    if @books.empty?
      puts 'There are no books in the library'
    else
      @books.each_with_index do |book, index|
        puts "#{show_index ? index : ' '} Title: \"#{book.title}\", Author:  #{book.author}"
      end
    end
  end

  def all_people(show_index: false)
    if @people.empty?
      puts 'There are no people in the library'
    else
      @people.each_with_index do |person, index|
        puts "#{show_index ? index : ' '} [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_rental
    puts 'Select a book from the following list by number'
    all_books(show_index: true)
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    all_people(show_index: true)

    person_index = gets.chomp.to_i
    puts 'Date (YYYY/MM/DD): '
    date = Date.parse(gets.chomp)
    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals << rental
    puts 'Rental Created Successfully'
    puts ' '
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
