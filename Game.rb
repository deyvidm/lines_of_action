require './GameBoard'
require './MenuOption'
require './Menu'
require './Player'

class Game 
  def initialize(p1, p2)
    @players = [p1,p2]
  end

  def setup()
    @board = GameBoard.new()
    @turn = 0
    @game_menu = Menu.new("Main menu", "Main menu for the lines of action game",'>',
                          [MenuOption.new('Move a piece', 'move', :move)])
  end

  def active_player()
    return @players[@turn]
  end

  def start
    @game_menu.display
    while !game_over
      print @game_menu.prompt
      code,args = @game_menu.handle_input(gets)
      case code
      when :quit
        puts "Exiting game."
        exit
      when :help
        @game_menu.display
      when :move
        row_index, column_index, direction = args
        target = @board.target_tile(row_index, column_index, direction)
        if target && validate_move(@board[row_index][column_index], target, direction) 
          active_player.move_piece(@board[row_index][column_index], target)
        else
          puts "Invalid move."
        end
      end
      @turn == 1? @turn = 0 : @turn = 1
    end
  end

  private
  def game_over()
    tile = @board.get_player_piece_index(@turn)
    return tile.connected(@board) == @players[@turn].piece_count

    #@board.each do |row|
    #  index = row.index do |tile|
    #	  tile.has_piece() && tile.piece().team == @turn
    #  end

    #  if index
    #	  first = row[index]
    #	  break
    #  end
    #end
    #return first.connected(board) == @players[@turn].piece_count
  end

end

game = Game.new(Player.new('player 1'), Player.new('player 2'))
game.setup
game.start
