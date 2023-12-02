require_relative 'app'

def main
  app = App.new

  loop do
    display_menu
    choice = take_user_choice

    case choice
    when 1 then app.list_books
    when 2 then app.list_people
    when 3 then create_person(app)
    when 4 then create_book(app)
    when 5 then create_rental(app)
    when 6 then list_rentals_for_person(app)
    when 7
      puts 'Exiting the Library Management System. Goodbye!'
      break
    else
      puts 'Invalid choice. Please enter a number between 1 and 7.'
    end
  end
end

def display_menu
  puts "\n===== Library Management System ====="
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List all rentals for a person'
  puts '7. Quit'
  print 'Enter your choice: '
end

def take_user_choice
  gets.chomp.to_i
end

def create_person(app)
  print 'Enter person name: '
  name = gets.chomp
  print 'Enter person age: '
  age = gets.chomp.to_i
  print 'Enter person type (teacher/student): '
  type = gets.chomp.downcase
  app.create_person(name, age, type)
end

def create_book(app)
  print 'Enter book title: '
  title = gets.chomp
  print 'Enter book author: '
  author = gets.chomp
  app.create_book(title, author)
end

def create_rental(app)
  print 'Enter person ID: '
  person_id = gets.chomp.to_i
  print 'Enter book title: '
  book_title = gets.chomp
  print 'Enter due date (YYYY-MM-DD): '
  due_date = gets.chomp
  app.create_rental(person_id, book_title, due_date)
end

def list_rentals_for_person(app)
  print 'Enter person ID: '
  person_id = gets.chomp.to_i
  app.list_rentals_for_person(person_id)
end

main
