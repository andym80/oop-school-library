require_relative 'person'

class Teacher < Person
  def initialize(specialization)
    @specialization = specialization
    super()
    _age,
    _name,
    _parent_permission = true
  end
end
