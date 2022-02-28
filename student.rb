require_relative './person'

class Student < Person
  def initialize(classroom)
    super
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end

b = Student.new(7)
p b.name
