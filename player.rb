class Player
  @piece_count = 0
  def initialize(name)
    @name = name
  end

  def takeTurn(Menu game_menu)
    game_menu.display()
    code = ''

    print game_menu.prompt
    code = handle_input(gets)
      print game_menu.prompt
  end

  def move_piece(Tile from, Tile to)
    to.place_piece(from.piece)
  end

end
