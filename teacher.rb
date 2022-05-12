require_relative './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, id = nil, name = 'Unknown')
    super(age, id, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
