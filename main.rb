require_relative 'app'

def main
     app = App.new

     loop do
    puts "\n===== Library Management System ====="
    puts "1. List all books"
    puts "2. List all people"
    puts "3. Create a person"
    puts "4. Create a book"
    puts "5. Create a rental"
    puts "6. List all rentals for a person"
    puts "7. Quit"
    print "Enter your choice: "

    choice = gets.chomp.to_i

     case choice
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      print "Enter person name: "
      name = gets.chomp
      print "Enter person age: "
      age = gets.chomp.to_i
      print "Enter person type (teacher/student): "
      type = gets.chomp.downcase
      app.create_person(name, age, type)
    when 4
      print "Enter book title: "
      title = gets.chomp
      print "Enter book author: "
      author = gets.chomp
      app.create_book(title, author)
    when 5
      print "Enter person ID: "
      person_id = gets.chomp.to_i
      print "Enter book title: "
      book_title = gets.chomp
      print "Enter due date (YYYY-MM-DD): "
      due_date = gets.chomp
      app.create_rental(person_id, book_title, due_date)
    when 6
      print "Enter person ID: "
      person_id = gets.chomp.to_i
      app.list_rentals_for_person(person_id)
    when 7
      puts "Exiting the Library Management System. Goodbye!"
      break
    else
      puts "Invalid choice. Please enter a number between 1 and 7."
    end

end