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

end