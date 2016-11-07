require './MenuOption'

class Menu
 
  def initialize(name, description, prompt='>', options=Array.new)
    @name = name
    @description = description
    @prompt = prompt.strip + " "
    @default_options = 
                [MenuOption.new('Exit the program immediately', 'quit', :quit),
                  MenuOption.new('Help with how to play the game', 'help',:help)]

    @options = @default_options + options
  end

  def display
    print " -~≈ " 
    print @name
    puts " ≈~- " 
    puts "-" * (@name.length + 10)
    puts ' '

    @options.each do |o| 
      o.display
      puts " "
    end
  end  
  
  def prompt
    return @prompt
  end
  
  def handle_input(user_input)
    tokens = user_input.split(' ')
    @options.each do |opt|
      if opt.matches(tokens[0])
        return opt.code, tokens[1..-1]
      end
    end
    return nil
  end
end
