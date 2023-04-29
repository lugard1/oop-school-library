require './person'

class Teacher < Person
  def initialize(age, name = 'Unknown', specialization = 'Math', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
