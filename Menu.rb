class Menu
  @default_options = [MenuOption('Help', 'help', HelpAction()),
                      MenuOption('Quit', 'quit', QuitAction())]
  
  def initialize(name, description, options) 
    @name = name
    @description = description
    @options = default_options + options
  end

  def display
    puts name
    puts "-" * name.length
    puts description

    @options.each {|o| o.display}
  end  
  
  def prompt
    return '> '
  end

  def handleInput(user_input)
    tokens = user_input.split(' ')
    @options.each do |opt|
      if opt.matches(tokens[0])
        code = option.activate_action(tokens[1])
        if code == 0
          self.class.display
        else 
          return code
        end
      end
    end
  end
end
