require './Tile'
require './Piece'

class GameBoard

	def initialize()
		@board = []
		@line_lookup = Hash.new


		line_0 = []
		line_1 = []
		line_2 = []
		line_3 = []
		line_4 = []
		line_5 = []
		line_6 = []
		line_7 = []

		for j in 7.downto(0)
			line_0.push(Tile.new(0,j, nil)
			line_1.push(Tile.new(1,j, nil)
			line_2.push(Tile.new(2,j, nil)
			line_3.push(Tile.new(3,j, nil)
			line_4.push(Tile.new(4,j, nil)
			line_5.push(Tile.new(5,j, nil)
			line_6.push(Tile.new(6,j, nil)
			line_7.push(Tile.new(7,j, nil)
		end

		#player1
		for j in 1..6
			line_0[j].place_piece(Piece.new(0))
			line_7[j].place_piece(Piece.new(0))
		end 

		#player2
		line_1[0].place_piece(Piece.new(1))
		line_1[7].place_piece(Piece.new(1))
		line_2[0].place_piece(Piece.new(1))
		line_2[7].place_piece(Piece.new(1))
		line_3[0].place_piece(Piece.new(1))
		line_3[7].place_piece(Piece.new(1))
		line_4[0].place_piece(Piece.new(1))
		line_4[7].place_piece(Piece.new(1))
		line_5[0].place_piece(Piece.new(1))
		line_5[7].place_piece(Piece.new(1))
		line_6[0].place_piece(Piece.new(1))
		line_6[7].place_piece(Piece.new(1))


		board.push(line_7)
		board.push(line_6)
		board.push(line_5)
		board.push(line_4)
		board.push(line_3)
		board.push(line_2)
		board.push(line_1)
		board.push(line_0)
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
  	puts "0 1 2 3 4 5 6 7"  
		puts '0 |' + (for j in 0..7; print(board[0][j].draw()+'|'); end).to_s[0..-4]
		puts '1 |' + (for j in 0..7; print(board[1][j].draw()+'|'); end).to_s[0..-4]
		puts '2 |' + (for j in 0..7; print(board[2][j].draw()+'|'); end).to_s[0..-4]
		puts '3 |' + (for j in 0..7; print(board[3][j].draw()+'|'); end).to_s[0..-4]
		puts '4 |' + (for j in 0..7; print(board[4][j].draw()+'|'); end).to_s[0..-4]
		puts '5 |' + (for j in 0..7; print(board[5][j].draw()+'|'); end).to_s[0..-4]
		puts '6 |' + (for j in 0..7; print(board[6][j].draw()+'|'); end).to_s[0..-4]
		puts '7 |' + (for j in 0..7; print(board[7][j].draw()+'|'); end).to_s[0..-4]
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
