class MenuOption
  
  def initialize(name, command, option_code)
    @name = name
    @command = command 
    @option_code = option_code
  end

  def display
    puts @command
    puts "-" * @command.length
    puts @name
  end

  def matches(user_input)
    return user_input == @command
  end
  
  def code
    return code
  end
end
