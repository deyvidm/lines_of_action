require './MenuAction'
class HelpAction < MenuAction
  def activate(args=nil)
    puts "This is the help menu"
    return 1
  end
end
