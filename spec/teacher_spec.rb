require './teacher'

describe Teacher do
  context 'When testing the Teacher class' do
    age = '30'
    name = 'Teacher'
    specialization = 'Science'
    teacher = Teacher.new(specialization, age, nil, name)

    it 'should validate the age of the teacher' do
      expect(teacher.age).to eq age
    end

    it 'should validate the name of the teacher' do
      expect(teacher.name).to eq name
    end

    it 'should return parent permission for teacher' do
      expect(teacher.specialization).to eq specialization
    end
  end
end