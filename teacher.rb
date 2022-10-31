require_relative './person'

class Teacher < Person
  attr_accessor :specialization, :id

  def initialize(age, name, specialization, parent_permission)
    @specialization = specialization
    super(
      age,
    name,
    parent_permission
  )
  end
end
