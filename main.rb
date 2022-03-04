require_relative './student'
require_relative './teacher'
require_relative './classroom'
require_relative './book'
require_relative './rental'

$books = []
$people = []
$rentals = []


def input_number(limit, statement='')
  input = nil
  while input == nil
    print "#{statement}: " unless statement.length == 0
    new_input = gets.chomp().to_i
    input = new_input if new_input > 0 && new_input <= limit
  end
  input
end

def input_string_no_num(limit=1, statement='')
  input = nil
  while input == nil
    print "#{statement}: " unless statement.length == 0
    new_input = gets.chomp
    input = new_input unless /[1-9]/.match(new_input) || new_input.strip.length < limit
  end
  input
end

def input_string(limit=1, statement='')
  input = nil
  while input == nil
    print "#{statement}: " unless statement.length == 0
    new_input = gets.chomp
    input = new_input unless new_input.strip.length < limit
  end
  input
end

def choose_y_n(statement='')
  input = nil
  while input == nil
    print "#{statement}" unless statement.length == 0
    print '[Y/N]: '
    new_input = gets.chomp
    input = new_input if new_input.downcase == 'y' || new_input.downcase == 'n'
  end
  if input.downcase == 'y'
    return true
  else
    return false
  end
end

def list_all_books(with_index = false)
  $books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" } unless with_index == true
  $books.each_with_index { |book, index | puts "#{index+1}) Title: #{book.title}, Author: #{book.author}" } unless with_index == false
end

def list_all_people(with_index = false)
  $people.each { |person| puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" } unless with_index == true
  $people.each_with_index { |person, index| puts "#{index+1}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" } unless with_index == false
end

def list_rentals_for_id
  person_id = input_number(400, 'ID of person')
  puts 'Rentals'
  $rentals.map {|rental| puts "Date: #{rental.date} , Book: #{rental.book.title} by #{rental.book.author}" if rental.person.id == person_id}
end

def create_student
  age = input_number(100, 'Age')
  name = input_string_no_num(1,'Name')
  has_parental_permission = choose_y_n('Has parent permission?')
  new_person = Student.new(nil, age, name, has_parental_permission)
  $people << new_person
end

def create_teacher
  age = input_number(100, 'Age')
  name = input_string_no_num(1,'Name')
  specialization = input_string(1,'Specialization')
  new_person = Teacher.new(specialization, age, name)
  $people << new_person
end

def create_person
  puts 'Do you want to create a student(1) or a teacher(2)?'
  print 'Input the number: '

  option = input_number(2)
  case option
  when 1
    create_student
  when 2
    create_teacher
  end
  puts 'Person created successfully'
end

def create_book
  title = input_string(1,'Title')
  author = input_string_no_num(1,'Author')
  newBook = Book.new(title, author)
  puts 'Book created successfully'
  $books << newBook
end

def create_rental
  return puts 'No books available' if $books.length == 0
  return puts 'No person available' if $people.length == 0

  puts 'Select a book from the following list of numbers'
  list_all_books(true)

  book_index = input_number($books.length) 
  book = $books[book_index -1]

  puts 'Select a person from the following list of numbers (not_id)'
  list_all_people(true)
  person_index = input_number($people.length)
  person = $people[person_index - 1]
  
  date = input_string(4, 'Date')

  newRental = Rental.new(person, book, date)
  $rentals << newRental
  puts 'Rental created successfully'
end


def display_menu
  options = [
    'List all books',
    'List all people',
    'Create a person', 
    'Create a book',
    'Create a rental', 
    'List all rentals for a given person id', 
    'Exit' 
  ]

  puts 'Please choose an option by entering a valid number: '
  puts ' '
  options.each_with_index { |choice, index| puts "#{index+1} - #{choice}" }
end


def main
  puts 'Welcome to School Library App'
  is_running = true
  while is_running == true
    display_menu

    option = input_number(7)

    case option
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals_for_id
    when 7
      is_running = false
    end
    puts ' '
  end
end

main()