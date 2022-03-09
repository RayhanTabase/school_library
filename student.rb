require_relative './person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, id, name, parent_permission)
    super(age, id, name, parent_permission: parent_permission)
    @classroom = classroom
    classroom&.add_student(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def to_json(*args)
    {
      JSON.create_id  => self.class.name,
      'a'             => [classroom, age, id, name, @parent_permission]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
