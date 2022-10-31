class Teacher < Person
  super()
  def initialize(_specialization_id, specialization)
    @specialization = specialization
  end
end
