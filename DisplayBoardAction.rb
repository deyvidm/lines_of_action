require './MenuAction'

class DisplayBoardAction < MenuAction 
  def initialize(game)
    @game = game
  end
  
  def activate(row_index, col_index, direction)
    tile = @game.gameBoard[row_index][col_index]
    return tile.hasPiece()
  end
end
