require './app'

class Main
  attr_accessor :app, :list_of_books, :list_of_people

  def initialize
    @app = App.new
    @list_of_books = []
    @list_of_people = []
  end

  # list of options
  def options
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    gets.chomp.to_i
  end

  def list_books
    @app.list_all_books(@list_of_books, show_list: true)
  end

  def list_people
    @app.list_all_people(@list_of_people, show_list: true)
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    select = gets.chomp.to_i

    puts 'Age:'
    age = gets.chomp.to_i

    puts 'Name:'
    name = gets.chomp

    puts 'Specialization:' if select == 2
    specialization = gets.chomp if select == 2

    puts 'Has parent permission? [Y/N]:' if select == 1
    parent_permission = gets.chomp.downcase == 'y' if select == 1

    person = @app.create_person(select, age, name, specialization, parent_permission)
    @list_of_people << person
    puts 'Person created successfully'
  end

  def create_book
    puts 'Title:'
    title = gets.chomp

    puts 'Author:'
    author = gets.chomp

    book = @app.create_book(title, author)
    @list_of_books << book
    puts 'Book created successfully'
  end

  def create_rental
    if list_of_books.empty? || list_of_people.empty?
      puts 'There are no books or people to create a rental'
      return false
    end

    # Select a book from the list of books by entering the number that corresponds to the book
    puts 'Select a book from the following list by number'
    @app.list_all_books(@list_of_books, show_list: true)
    book = gets.chomp

    # Select a person from the list of people by entering the number that corresponds to the person
    puts 'Select a person from the following list by number (not id)'
    @app.list_all_people(@list_of_people, show_list: true)
    person = gets.chomp

    # Enter the date
    puts 'Date:'
    date = gets.chomp
    @app.create_rental(date, @list_of_books[book.to_i], @list_of_people[person.to_i])
    puts 'Rental created successfully'
  end

  # List all rentals for a given person id
  def list_rentals_for_person_id
    puts 'ID of person:'
    id = gets.chomp
    puts "Rentals: \n"
    rentals = @app.list_rentals_for_person_id(id.to_i, @list_of_people)
    rentals&.each { |r| puts "Date: #{r.date}, Book: #{r.book.title} by #{r.book.author}" }
    puts "\n"
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def run
    puts 'Welcome to School Library App!'
    puts "\n"
    loop do
      case options
      when 1 then list_books
      when 2 then list_people
      when 3 then create_person
      when 4 then create_book
      when 5 then create_rental
      when 6 then list_rentals_for_person_id
      when 7
        puts 'Thank you for using this app!'
        break
      else
        puts 'That is not a valid option'
      end
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end

main = Main.new
main.run
