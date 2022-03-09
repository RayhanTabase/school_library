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

  def to_json(*args)
    {

      JSON.create_id => self.class.name,
      'a' => [specialization, age, id, name]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
