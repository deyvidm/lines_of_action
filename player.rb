class Player

  def initialize(name)
    @name = name
    @piece_count = 0
  end

  def take_turn(game_menu)
    game_menu.display
    choice = gets
    while game_menu.handle_input(choice) do
      $hi = "bye"
    end
  end
end