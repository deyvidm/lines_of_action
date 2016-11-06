class Game 
  def initialize(Player p1, Player p2)
    @players = [p1,p2]
  end

  def setup()
  	@board = GameBoard.new()
  	@turn = 0
  	@game_menu = Menu.new("Main menu", "Main menu for the lines of action game", ">", 
  		[
  			MenuOption.new("Move", "Move a piece", MoveAction.new(self)),
  			MenuOption.new("Display", "Display the board", DisplayBoardAction.new(self)),
  			MenuOption.new("Quit", "Quit the current game", QuitAction.new(self))
  		]
  		,nil)

  end

  def active_player()
  	return players[turn]
  end

  def play_turn()
  	self.active_player().take_turn()
  end
  
  def game_over()
  	first = nil
	  board.each do |row|
		index = row.index do |tile|
			tile.has_piece() && tile.piece().team == turn
		end
		if index
			first = row[index]
			break
		end
	end
	return first.connected(board) == players[turn].piece_count
  end

end
