require_relative 'nameable'
# Make sure that this class has a method correct_name implemented. It should simply return the name attribute.

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, parent_permission, name = 'Unknown')
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end
end
