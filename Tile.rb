require './Piece'

class Tile

	def initialize(row, column, piece= nil)
		@row = row
		@column = column
		@space = piece
	end

	def place_piece(piece)
		print @row 
    print ", "
    print @column
    print " "
    print has_piece
    if has_piece()
			self
		end
		@space = piece
    print "-->"
    puts has_piece
	end

	def has_piece()
		@space.nil?.!
	end	

	def piece()
		@space	
	end

	def connected(board)
		if @space.nil?
			return 0
		else
			visited = []
			connected_rec(board, visited)
		end
	end
		
		
	def connected_rec(board, visited)
		if visited.include?(self)
			return 0
		else
			visited.push(self)
			neighbours = neighbours(board)
			neighbours.each do |tile|
				return 1 + tile.connected_rec()
			end
		end
	end


	def draw()
		if has_piece()
			@space.draw()
		else
			return '_'
		end
	end

	private
	
	def neighbours(board)
		neighbours = []
		
		if has_piece()
			#north_west		
			if @row-1 >= 0 && @column-1 >= 0
				if @space.get_team == board.get_piece_team(@row-1,@column-1)
					neighbours.push(board.get_tile(@row-1,@column-1))
				end
			end
			#north
			if @row-1 >= 0 
				if @space.get_team == board.get_piece_team(@row-1,@column)
					neighbours.push(board.get_tile(@row-1,@column))
				end
			end
			#north_east
			if @row-1 >= 0 && @column+1 <= 7
				if @space.get_team == board.get_piece_team(@row-1,@column+1)
					neighbours.push(board.get_tile(@row-1,@column+1))
				end
			end
			#west
			if @column-1 >= 0
				if @space.get_team == board.get_piece_team(@row,@column-1)
					neighbours.push(board.get_tile(@row,@column-1))
				end
			end
			#east
			if @column+1 <= 7
				if @space.get_team == board.get_piece_team(@row,@column+1)
					neighbours.push(board.get_tile(@row,@column+1))
				end
			end
			#south_west
			if @row+1 <= 7 && @column-1 >= 0
				if @space.get_team == board.get_piece_team(@row+1,@column-1)
					neighbours.push(board.get_tile(@row+1,@column-1))
				end
			end
			#south
			if @row+1 <= 7
				if @space.get_team == board.get_piece_team(@row+1,@column)
					neighbours.push(board.get_tile(@row+1,@column))
				end
			end
			#south_east
			if @row+1 <= 7 && @column+1 <= 7
				if @space.get_team == board.get_piece_team(@row+1,@column+1)
					neighbours.push(board.get_tile(@row+1,@column+1))
				end
			end
		end
		neighbours
	end

end


