class Piece 
  def initialize(team)
    @team = team
  end

  def draw
    print ['O', 'X'][@team]
  end

  def get_team()
  	return @team
  end
end

