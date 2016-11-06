class Menu
  @default_options = [MenuOption('Help', 'help', HelpAction()),
                      MenuOption('Quit', 'quit', QuitAction())]
  
  def initialize(name, description, prompt = '>', options, prev_menu=nil) 
    @name = name
    @description = description
    @prompt = prompt.strip + " "
    @options = default_options + options
  end

  def display
    puts name
    puts "-" * name.length
    puts description

    @options.each {|o| o.display}
  end  
  
  def prompt
    return @prompt
  end

  def handleInput(user_input)
    tokens = user_input.split(' ')
    @options.each do |opt|
      if opt.matches(tokens[0])
        code = option.activate_action(tokens[1])
        if code == 1
          self.class.display
        else 
          return code
        end
      else
        return -1
      end
    end
  end
end
