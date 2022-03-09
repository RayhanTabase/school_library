class Rental
  attr_reader :person, :book, :date

  def initialize(person, book, date)
    @person = person
    @book = book
    @date = date
    person.add_rental(self)
    book.add_rental(self)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [person, book, date]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
