require './book'
require './student'
require './rental'

describe Rental do
  context 'When testing the Rental class' do
    book = Book.new('title', 'author')
    student = Student.new(nil, 12, nil, 'Student', true)
    date = '12/01/2000'
    rental = Rental.new(student, book, date)

    it 'should validate the date of the rental' do
      expect(rental.date).to eq date
    end

    it 'should validate the student of the rental' do
      expect(rental.person).to eq student
    end

    it 'should validate the book of the rental' do
      expect(rental.book).to eq book
    end
  end
end