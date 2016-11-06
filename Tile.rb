class Tile

	def initialize(row, column, piece= nil)
		@row = row
		@column = column
		@space = piece
	end

	def place_piece(piece)
		if has_piece()
			self
		end
		@piece = piece
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
		visited = [7][7]
		connected_rec(board, visited)
		end
	end
		
		
	def connected_rec(board, visited)
		if visited.include(self)
			return 0
		else
			visited[@row][@column] = self
			neighbours = neighbours(board)
			neighbours.each do |tile|
			return 1 + tile.connected()
		end
	end

	end

	def draw()
		if has.piece()
			@space.draw()
		else
			return '_'
	end

	private
	
	def neighbours(board)
		neighbours = []
		
		if has_piece()
			#north_west		
			if @row-1 >= 0 && @column-1 >= 0
				if @space.team == board[@row-1][@column-1].piece().team
					neighbours.push(board[@row-1][@column-1])
				end
			end
			#north
			if @row-1 >= 0 
				if @space.team == board[@row-1][@column].piece().team
					neighbours.push(board[@row-1][@column])
				end
			end
			#north_east
			if @row-1 >= 0 && @column+1 <= 7
				if @space.team == board[@row-1][@column+1].piece().team
					neighbours.push(board[@row-1][@column+1])
				end
			end
			#west
			if column-1 >= 0
				if @space.team == board[@row][@column-1].piece().team
					neighbours.push(board[@row][@column-1])
				end
			end
			#east
			if column+1 <= 7
				if @space.team == board[@row][@column+1].piece().team
					neighbours.push(board[@row][@column+1])
				end
			end
			#south_west
			if row+1 <= 7 && column-1 >= 0
				if @space.team == board[@row+1][@column-1].piece().team
					neighbours.push(board[@row+1][@column-1])
				end
			end
			#south
			if row+1 <= 7
				if @space.team == board[@row+1][@column].piece().team
					neighbours.push(board[@row+1][@column])
				end
			end
			#south_east
			if row+1 <= 7 && column+1 <= 7
				if @space.team == board[@row+1][@column+1].piece().team
					neighbours.push(board[@row+1][@column+1])
				end
			end
		end
		neighbours
	end

end


