require './GameBoard'
require './MenuOption'
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
      while !game_over
          @game_menu.display
          print @game_menu.prompt
          code,args = @game_menu.handle_input(gets)
          case code
          when :quit
              puts "Exiting game."
              exit
          when :help
              puts "help menu"
          when :move
              row_index, column_index, direction = args
              target = target_tile(row_index, column_index, direction)
              if target && validate_move(@board[row_index][column_index], target, direction) 
                  active_player.move_piece(@board[row_index][column_index], target)
              else
                  puts "Invalid move."
              end
          end
      end
  end
  
private
  
  def target_tile(row_index, column_index, direction)
  
  end

  def game_over()
  	first = nil
	  @board.each do |row|
		  index = row.index do |tile|
			  tile.has_piece() && tile.piece().team == @turn
		  end

		  if index
			  first = row[index]
			  break
		  end
	  end
	  return first.connected(board) == @players[@turn].piece_count
  end

end

p1 = Player.new('player 1')
p2 = Player.new('player 2')

game = Game.new(Player.new('player 1'), Player.new('player 2'))
game.setup
game.play_turn
