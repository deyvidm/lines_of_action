class Piece 
  def initialize(team)
    @team = team
  end

  def draw
    return ['O', 'X'][@team]
end

