require_relative './person_class'

class Teacher < Person
  attr_accessor :specialization, :id

  def initialize(age, name, specialization, parent_permission = true)
    @specialization = specialization
    super(
      age,
    name,
    parent_permission
  )
  end
end
