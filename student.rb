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
end
