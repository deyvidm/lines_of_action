require './Menu'
require './Tile'

class Player
  def initialize(name)
    @name = name
    @piece_count = 12
  end

  def takeTurn(game_menu)
    game_menu.display()
    code = ''

    print game_menu.prompt
    code = handle_input(gets)
      print game_menu.prompt
  end

  def movePiece(from,to)
    to.place_piece(from.piece)
  end
  
  def removePiece
    @piece_count -= 1
  end
end
