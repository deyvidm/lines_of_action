class BoardGame

	def initialize()
		@board = [7][7]
		@line_lookup = Hash.new

		#Initialize player 0
		for i in 1..6
			@board[0][i] = Tile.new(0,i, Piece.new(0))
			@board[7][i] = Tile.new(7,i, Piece.new(0))
		end

		#Initialize player 1
		for i in 1..6
			@board[i][0] = Tile.new(i,0, Piece.new(1))
			@board[i][7] = Tile.new(i,7, Piece.new(1))
		end
	end

	def pieces_in_lines(row, columnm, direction)
		orientation = direction_to_orientation(direction)
		lines_array = line_lookup[orientation]
		case orientation
		when :horizontal	
			lines_array[column]
		when :vertical
			lines_array[row]
		when :left_diagonal
			lines_array.reverse[row - column + 7]
		when :right_diagonal
			lines_array.reverse[row + column]
		end	 
	end

	def update_piece_counts()
			@line_lookup[:vertical] = vertical_lines_count()
			@line_lookup[:horizontal] = horizontal_lines_count()	
			@line_lookup[:left_diagonal] = left_diagonal_lines_count()
			@line_lookup[:right_diagonal] = right_diagonal_lines_count()
	end



	def draw
	end

	private 

	def left_diagonal_lines_count()
		lines_count = []
		ib = tiles_to_integer()
		lines_count.push(ib[0][7])
		lines_count.push(ib[0][6]+ib[1][7])
		lines_count.push(ib[0][5]+ib[1][6]+ib[2][7])
		lines_count.push(ib[0][4]+ib[1][5]+ib[2][6]+ib[3][7])
		lines_count.push(ib[0][3]+ib[1][4]+ib[2][5]+ib[3][6]+ib[4][7])
		lines_count.push(ib[0][2]+ib[1][3]+ib[2][4]+ib[3][5]+ib[4][6]+ib[5][7])
		lines_count.push(ib[0][1]+ib[1][2]+ib[2][3]+ib[3][4]+ib[4][5]+ib[5][6]+ib[6][7])
		lines_count.push(ib[0][0]+ib[1][1]+ib[2][2]+ib[3][3]+ib[4][4]+ib[5][5]+ib[6][6]+ib[7][7])
		lines_count.push(ib[1][0]+ib[2][1]+ib[3][2]+ib[4][3]+ib[5][4]+ib[6][5]+ib[7][6])
		lines_count.push(ib[2][0]+ib[3][1]+ib[4][2]+ib[5][3]+ib[6][4]+ib[7][5])
		lines_count.push(ib[3][0]+ib[4][1]+ib[5][2]+ib[6][3]+ib[7][4])
		lines_count.push(ib[4][0]+ib[5][1]+ib[6][2]+ib[7][3])
		lines_count.push(ib[5][0]+ib[6][1]+ib[7][2])
		lines_count.push(ib[6][0]+ib[7][1])
		lines_count.push(ib[7][0])
		libes_count
	end

	def right_diagonal_lines_count()
		lines_count = []
		ib = tiles_to_integer()
		lines_count.push(ib[0][0])
		lines_count.push(ib[0][1]+ib[1][0])
		lines_count.push(ib[0][2]+ib[1][1]+ib[2][0])
		lines_count.push(ib[0][3]+ib[1][2]+ib[2][1]+ib[3][0])
		lines_count.push(ib[0][4]+ib[1][3]+ib[2][2]+ib[3][1]+ib[4][0])
		lines_count.push(ib[0][5]+ib[1][4]+ib[2][3]+ib[3][2]+ib[4][1]+ib[5][0])
		lines_count.push(ib[0][6]+ib[1][5]+ib[2][4]+ib[3][3]+ib[4][2]+ib[5][1]+ib[6][0])
		lines_count.push(ib[0][7]+ib[1][6]+ib[2][5]+ib[3][4]+ib[4][3]+ib[5][2]+ib[6][1]+ib[7][0])
		lines_count.push(ib[1][7]+ib[2][6]+ib[3][5]+ib[4][4]+ib[5][3]+ib[6][2]+ib[7][1])
		lines_count.push(ib[2][7]+ib[3][6]+ib[4][5]+ib[5][4]+ib[6][3]+ib[7][2])
		lines_count.push(ib[3][7]+ib[4][6]+ib[5][5]+ib[6][4]+ib[7][3])
		lines_count.push(ib[4][7]+ib[5][6]+ib[6][5]+ib[7][4])
		lines_count.push(ib[5][7]+ib[6][6]+ib[7][5])
		lines_count.push(ib[6][7]+ib[7][6])
		lines_count.push(ib[7][7])
		libes_count
	end


	def tiles_to_integer
		integer_board = [][]
		for i,j in 0..7
			if board[i][j].has_piece()
				integer_board[i][j] = 1
			else integer_board[i][j] = 0
			end
		end
		integer_board
	end

	def horizontal_lines_count()
		lines_count = []
		for i in 0..7
			lines_count.push(horizontal_line_count(i))
		end
		lines_count				
	end

	def vertical_lines_count()
		lines_count = []
		for j in 0..7
			lines_count.push(vertical_line_count(j))
		end
		lines_count				
	end

	def horizontal_line_count(i)
		count = 0
		for j in 0..7
			if board[i][j].has_piece()
				count = count + 1
			end
		count
		end
	end

	def vertical_line_count(j)
		count = 0
		for i in 0..7
			if board[i][j].has_piece()
				count = count + 1
			end
		count
		end
	end

	def direction_to_orientation(direction)
		case direction
		when :north, :south
			:vertical
		when :east, :west
			:horizontal
		when :north_east, :south_west
			:left_diagonal
		when :north_west, :south_east
			:right_diagonal
		end
	end
	
end

a = BoardGame.new

