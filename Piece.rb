class Piece 
  def initialize(team)
    @team = team
  end

  def draw
    puts ['O', 'X'][@team]
  end

  def getTeam()
  	@team
  end
end

