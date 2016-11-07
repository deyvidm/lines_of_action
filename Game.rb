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
                          [MenuOption.new('Select a piece to move: <row> <col> <south|north_west|etc.>', 'move', :move)])
  end

  def active_player()
    return @players[@turn]
  end

  def start
    @game_menu.display
    while !game_over
      puts ''
      @board.draw
      puts ''
      puts 'Player: ' + @players[@turn].name + "\nPieces: " + ['O', 'X'][@turn]
      print @game_menu.prompt
      code,args = @game_menu.handle_input(gets)
      case code
      when :quit
        puts "Exiting game."
        exit
      when :help
        print @game_menu.prompt
        code,args = @game_menu.handle_input(gets)
      when :move
        row_index = args[0].to_i
        column_index = args[1].to_i
        direction = args[2]
        target = @board.target_tile(row_index, column_index, direction)
        if target && @board.validate_move(@board.get_tile(row_index,column_index), target, direction.to_sym) 
          active_player.move_piece(@board.get_tile(row_index,column_index), target)
        else
          puts "Invalid move."
        end
      else 
        puts 'Invalid command.'
      end
      @turn == 1? @turn = 0 : @turn = 1
    end
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

game = Game.new(Player.new('player 1'), Player.new('player 2'))
game.setup
game.start
