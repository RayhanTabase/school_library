require_relative './corrector'

class Person
  attr_accessor :name, :age

  attr_reader :id

  def initialize(age, id = nil, name = 'Unknown', parent_permission: true)
    @id = id || rand(1...400)
    @name = name
    @parent_permission = parent_permission
    @age = age
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    @parent_permission || is_of_age?
  end

  private :of_age?
end
