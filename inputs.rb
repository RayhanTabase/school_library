class Inputs
  def input_number(limit, statement = '')
    input = nil
    while input.nil?
      print "#{statement}: " unless statement.empty?
      new_input = gets.chomp.to_i
      input = new_input if new_input.positive? && new_input <= limit
    end
    input
  end
  
  def input_string_no_num(limit = 1, statement = '')
    input = nil
    while input.nil?
      print "#{statement}: " unless statement.empty?
      new_input = gets.chomp
      input = new_input unless /[1-9]/.match(new_input) || new_input.strip.length < limit
    end
    input
  end
  
  def input_string(limit = 1, statement = '')
    input = nil
    while input.nil?
      print "#{statement}: " unless statement.empty?
      new_input = gets.chomp
      input = new_input unless new_input.strip.length < limit
    end
    input
  end
  
  def choose_y_n(statement = '')
    input = nil
    while input.nil?
      print statement.to_s unless statement.empty?
      print '[Y/N]: '
      new_input = gets.chomp
      input = new_input if new_input.downcase == 'y' || new_input.downcase == 'n'
    end
    input.downcase == 'y'
  end
end