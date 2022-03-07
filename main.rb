require_relative './student'
require_relative './teacher'
require_relative './classroom'
require_relative './book'
require_relative './rental'



require_relative './inputs'

def main
  puts 'Welcome to School Library App'
  while is_running == true
    display_menu
    option = input_number(7)
    break if option == 7
    display_choice(option)
  end
end

main
