class Rental
  attr_reader :person, :book, :date

  def initialize(person, book, date)
    @person = person
    @book = book
    @date = date
    person.add_rental(self)
    book.add_rental(self)
  end
end
