require_relative './student'
require_relative './teacher'
require_relative './classroom'
require_relative './book'
require_relative './rental'
require_relative './inputs'
require_relative './library.rb'
include Inputs
def main
  library = Library.new
  puts 'Welcome to School Library App'
  flag = true
  while flag
    library.display_menu
    option = input_number(7)
    flag = option === 7 ? false : flag
    library.display_choice(option)
  end
end

main
