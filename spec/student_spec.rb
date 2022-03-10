require_relative '../student'

describe Student do
  context 'When testing the Student class' do
    age = '12'
    name = 'Student'
    parent_permission = true
    student = Student.new(nil, age, nil, name, parent_permission)

    it 'should validate the age of the student' do
      expect(student.age).to eq age
    end

    it 'should validate the name of the student' do
      expect(student.name).to eq name
    end

    it 'should return parent permission for student' do
      expect(student.parent_permission).to be parent_permission
    end

    it 'should validate the play_hooky for student' do
      expect(student.play_hooky).to eq '¯\(ツ)/¯'
    end
  end
end
