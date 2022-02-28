class Person
  attr_accessor :name, :age

  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = rand(10...42)
    @name = name
    @parent_permission = parent_permission
    @age = age
  end

  private

  def of_age?
    @age >= 18
  end

  def can_use_services?
    @parent_permission || is_of_age?
  end
end
