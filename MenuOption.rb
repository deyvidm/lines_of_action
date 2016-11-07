class MenuOption
  
  def initialize(name, command, option_code)
    @name = name
    @command = command 
    @option_code = option_code
  end

  def display
    print @command
    print " ---- " 
    puts @name
  end

  def matches(user_input)
    puts '| ' + user_input + ' -- ' + @command 
    return user_input == @command
  end
  
  def code
    return @option_code
  end
end
