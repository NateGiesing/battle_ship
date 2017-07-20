require_relative "board"
class Computer
  attr_reader :grid

  def initialize
    @grid = Board.new.board
  end

  def column_picker
    rand(1..4)
  end

  def row_picker
    [:a, :b, :c, :d].sample
  end

  def grid_writer(key, index, symbol)
    grid[key][index] = symbol
  end

  def ship_one_placement
    key = row_picker
    index = column_picker
    grid_writer(key, index, "$")
    ship_one_second_placement(key, index)
  end

  def ship_one_second_placement(key, index)
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
    grid_writer(second_position[0], second_position[1], "$")
  end

  def position_validation(key, index)
    if grid[key][index] == " "
      true
    else
      false
    end
  end

  def first_position(key, index)
    valid = position_validation(key, index)
    if valid
      grid_writer(key, index, "&")
    else
      ship_two
    end
    [key, index]
  end

  def ship_two
    key = row_picker
    index = column_picker
    first_position(key, index)
    # require "pry"; binding.pry
    finalize_second_ship(key, index)
  end

  def finalize_second_ship(key, index, symbol)
    possible_position = []
    if key != :a && key != :b
      require "pry"; binding.pry
      column_up_1 = (key.to_s.ord-1).chr.to_sym
      valid = position_validation(column_up_1, index)
      if valid
        column_up_2 = (key.to_s.ord-2).chr.to_sym
        valid = position_validation(column_up_2, index)
      end
      if valid
        grid_writer(key.to_s.ord-1, index, symbol)
        grid_writer(key.to_s.ord-2, index, symbol)
      end
    end
    if key != :c && key != :d
      column_down_1 = (key.to_s.ord+1).chr.to_sym
      valid = position_validation(column_down_1, index)
      if valid
        column_down_2 = (key.to_s.ord+2).chr.to_sym
        valid = position_validation(column_down_2, index)
      end
      if valid
        grid_writer(key.to_s.ord+1, index, symbol)
        grid_writer(key.to_s.ord+2, index, symbol)
      end
    end
    if index != 4 && index != 3
      row_right_1 = index + 1
      valid = position_validation(key, row_right_1)
      if valid
        row_right_2 = index + 2
        valid = position_validation(key, row_right_2)
      end
      if valid
        grid_writer(key.to_s.ord+1, index, symbol)
        grid_writer(key.to_s.ord+2, index, symbol)
        # possible_position << [[key, row_right_1], [key, row_right_2]]
      end
    end
    if index != 1 && index != 2
      row_left_1 = index -1
      valid = position_validation(key, row_left_1)
      if valid
        row_left_2 = index -2
        valid = position_validation(key, row_left_2)
      end
      if valid
        grid_writer(key.to_s.ord-1, index, symbol)
        grid_writer(key.to_s.ord-2, index, symobl)
      end
    end
  end
end
