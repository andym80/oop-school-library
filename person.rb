class Person
  def initialize(id, age, name = 'Unknown')
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
end

private

def of_age?
  @age >= 18
end

public

def can_use_services?
  of_age?
end
