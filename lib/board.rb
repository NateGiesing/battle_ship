
class Board
attr_reader :board
  def initialize
    @board = {
              bs: [" ", " *BATTLESHIP*", " "],
              n:  [" ", "1", "2", "3", "4"],
              a:  ["A", " ", " ", " ", " "],
              b:  ["B", " ", " ", " ", " "],
              c:  ["C", " ", " ", " ", " "],
              d:  ["D", " ", " ", " ", " "]
            }
  end

  def grid_validator(row, column)
    if ["a", "b", "c", "d"].include?(row)
      if ["1", "2", "3", "4"].include?(column)
        true
    else
      invalid_message
      end
    end
  end

  def placement_validator(key, index)
    possible_position = []
    if key != :a
      row = (key.to_s.ord-1).chr.to_sym
      possible_position << [row, index]
    end
    if index != 4
      column = index +1
      possible_position << [key, column]
    end
    if key != :d
      row = (key.to_s.ord+1).chr.to_sym
      possible_position << [row, index]
    end
    if index != 1
      column = index - 1
      possible_position << [key, column]
    end
    # require "pry"; binding.pry
    second_position = possible_position.sample
    grid_writer(second_position[0], second_position[1])
  end
end
