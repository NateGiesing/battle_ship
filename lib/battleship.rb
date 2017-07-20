require "./lib/manager"

class Battleship

  def initialize
    Manager.new.start_game
  end

end

Battleship.new
