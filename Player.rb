require './Menu'
require './Tile'

class Player
  def initialize(name)
    @name = name
    @piece_count = 12
  end

  def take_turn(game_menu)
    game_menu.display()
    code = -1
    while code == -1 do 
      print game_menu.prompt
      code = game_menu.handle_input(gets)
    end
 end

  def move_piece(from,to)
    to.place_piece(from.piece)
  end
  
  def remove_piece
    @piece_count -= 1
  end
end
