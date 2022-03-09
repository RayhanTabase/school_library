require_relative './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name = 'Unknown')
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
 
  def to_json(*args)
    {
      JSON.create_id  => self.class.name,
      'a'             => [specialization, age, name ]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end

end
