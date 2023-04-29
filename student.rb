require_relative 'person'
require_relative 'classroom'
require './book'
require './rental'

class Student < Person
  attr_reader :classroom, :parent_permission, :name

  def initialize(age, name = 'Unknown', classroom = 'classA', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end

# student1 = Student.new(24, 'lugard', 'classD')
# student2 = Student.new(20, 'Ermiyas', 'classA')
# print student1.age
# print student1.name
# print student1.classroom

# puts student2.age
# puts student2.name
# puts student2.classroom
# classroom1 = Classroom.new('A1')
# puts classroom1.add_student(student1)
# puts classroom1.add_student(student2)

# puts classroom1.students[1].classroom

# book1 = Book.new('Half of a yellow sun', 'Chimamanda')
# book2 = Book.new('Things fall Apart', 'Chinua')

# puts book1.author
# puts book2.author

# rental1 = Rental.new('2023-04-28', book1, student1)
# rental2 = Rental.new('2023-04-28', book2, student1)
# rental3 = Rental.new('2023-04-27', book1, student2)

# puts rental1.book.title
# puts rental1.person.name

# puts rental2.book.title
# puts rental2.person.name

# puts rental3.book.title
# puts rental3.person.name