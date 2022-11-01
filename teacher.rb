require_relative './person'

class Teacher < Person
  attr_accessor :specialization, :id

  def initialize(specialization, age, parent_permission, name)
    @specialization = specialization
    super(
      age,
    name,
    parent_permission
  )
  end
end
