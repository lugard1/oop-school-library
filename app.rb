require './book'
require './person'
require './teacher'
require './student'

class App
  def list_all_books(books, show_list: false)
    puts 'No list of books are found' if books.empty?
    books.each_with_index do |book, list|
      puts "#{"#{list})" if show_list} Title: #{book.title}, Author: #{book.author}"
    end
    puts "\n"
  end

  def list_all_people(people, show_list: false)
    puts 'No list of people are found' if people.empty?
    people.each_with_index do |person, list|
      puts "#{"#{list})" if show_list} [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    puts "\n"
  end

  def create_person(select, age, name, specialization, parent_permission)
    case select
    when 1
      Student.new(age, name, parent_permission)
    when 2
      Teacher.new(age, name, specialization, parent_permission: parent_permission)
    end
  end

  def list_rentals_for_person_id(id_person, persons)
    puts "No rentals found for id #{id_person}" if persons.none? { |person| person.id == id_person }
    return persons.find { |person| person.id == id_person }.rentals if persons.any? { |person| person.id == id_person }

    puts "\n"
  end

  def create_book(title, author)
    Book.new(title, author)
  end

  def create_rental(date, book, person)
    Rental.new(date, book, person)
  end
end
