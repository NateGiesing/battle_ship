require "./lib/message"
class Manager
  include Message

  def start_game
    welcome
    initial_prompt
  end

  def initial_prompt
    display_initial_prompt
    input = gets.chomp
    director(input)
  end

  def play_game
    Computer.new
  end

  def director(input)
    case input
    when "p"
      play_game
    when "i"
      instructions_message
    when "q"
      quit_game
    else
      invalid_message
    end
  end
end
