require_relative '../person'
require_relative '../book'

describe Person do
  context 'When testing the Person class' do
    age = 10
    name = 'person'
    parent_permission = false
    person = Person.new(age, nil, name, parent_permission: parent_permission)
    person_two = Person.new(30, nil, name, parent_permission: true)

    it 'should validate the age of the person' do
      expect(person.age).to eq age
    end

    it 'should validate the name of the person' do
      expect(person.name).to eq name
    end

    it 'should validate parent permission for parent' do
      expect(person.parent_permission).to be parent_permission
    end

    it 'should return false if person cannot use service' do
      expect(person.can_use_services?).to be false
    end

    it 'should return true if person can use service' do
      expect(person_two.can_use_services?).to be true
    end
  end
end