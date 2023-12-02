class App
  attr_accessor :people, :books, :rentals

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
    puts "List of People:"
    @people.each { |person| puts "#{person.name} (ID: #{person.id})" }
  end

  def create_person(name, age, type)
    if type == 'teacher'
      teacher = Teacher.new(name, age)
      @people << teacher
      puts "#{teacher.name} (Teacher) created with ID: #{teacher.id}"
    elsif type == 'student'
      student = Student.new(name, age)
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

end
