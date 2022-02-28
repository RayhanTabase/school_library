class Person

  def initialize(name = "Unknown",parent_permission = true, age)
    @id 
    @name = name
    @parent_permission = parent_permission
    @age = age
  end

  def id
    @id
  end

  def name
    @name
  end

  def age
    @age
  end

  def name=(name)
    @name = name
  end

  def age=(age)
    @age = age
  end

  private
  def is_of_age?
    @age >= 18
  end

  def can_use_services?
    @parent_permission || self.is_of_age?
  end

end
