require "./lib/manager"
require "./lib/computer"
require "./lib/board"
require "./lib/player"
require "./lib/messages"



class Battleship

  def initialize
    Manager.new.start_game
  end

end

Battleship.new
