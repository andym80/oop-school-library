require_relative './person'

class Teacher < Person
  attr_accessor :specialization, :id

  def initialize(age, specialization, name = 'Unknown')
    @specialization = specialization
    super(
      age,
    name
  )
  end
end
