require_relative './person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    classroom&.add_student(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
  
  def to_json(*args)
    {
      JSON.create_id  => self.class.name,
      'a'             => [classroom, age, name]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end

end
