class MenuOption
  
  def initialize(name, command, action)
    @name = name
    @command = command 
    @action = action 
  end

  def display() 
    puts name + " -- " + command
  end

  def matches(user_input)
    return user_input == @command
  end

  def activate_action(args)
    return @action.activate(args)
  end
end
