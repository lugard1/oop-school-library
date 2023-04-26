require './person'

class Student < Person
  def initialize(age, parent_permission: true, name: 'Unknown', classroom: nil)
    super(age, parent_permission, name)
    @classroom = classroom
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end
end
