require_relative './person'

class Teacher < Person
  attr_accessor :specialization, :id

  def initialize(specialization, age, parent_permission, _name)
    @specialization = specialization
    super(
      age,
    parent_permission,
    name
  )
  end
end
