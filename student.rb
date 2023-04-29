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
