require "./lib/computer"
module Message
  def welcome
    puts "Welcome to BATTLESHIP, Would you like to (p)lay, read the (i)nstructions, or (q)uit? >"
  end

  def play_game
   puts `clear`
   puts
   puts "=============="
   puts "  F-I-G-H-T   "
   puts "=============="
   computer = Computer.new
   human_player = Player.new
 end

  def instructions_message
   puts "To play the game...do all this stuff.\n Press ENTER to continue."
   enter = gets.chomp
   return if enter.empty?
  end
  

  def display_initial_prompt
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def quit_game
   puts "Goodbye."
   print "."
   sleep(0.4)
   print "..."
   sleep(0.4)
   print "....."
   sleep(0.4)
   print "Exit"
   sleep(0.2)
   exit
 end

end
