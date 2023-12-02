require_relative 'app'

def main
  app = App.new

  loop do
    display_menu
    choice = take_user_choice
    break if process_user_choice(app, choice) == :quit
  end
end

def process_user_choice(app, choice)
  choices = {
    1 => -> { app.list_books },
    2 => -> { app.list_people },
    3 => -> { create_person(app) },
    4 => -> { create_book(app) },
    5 => -> { create_rental(app) },
    6 => -> { list_rentals_for_person(app) },
    7 => -> { quit_application },
    :default => -> { invalid_choice }
  }

  choices.fetch(choice, choices[:default]).call
end

def quit_application
  puts 'Exiting the Library Management System. Goodbye!'
  :quit
end

def invalid_choice
  puts 'Invalid choice. Please enter a number between 1 and 7.'
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
