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

  def ship_one
    key = row_picker
    index = column_picker
    grid_writer(key, index, "$")
    second_placement_validator(key, index)
  end

  def ship_two
    # key = row_picker
    # index = column_picker
    # valid = grid_validator(key, index)
    # if valid
    #   grid_writer(key, index)
    # else
    #   ship_two
    # end
    first_position
    # position_validation(key, index)
    finalize_second_ship
  end

  def position_validation(key, index)
    if grid[key][index] == "$"
      false
    else
      true
    end
  end

  def first_position
    key = row_picker
    index = column_picker
    valid = position_validation(key, index)
    if valid
      grid_writer(key, index, "&")
    else
      first_position
    end
    [key, index]
  end

  def second_placement_validator(key, index)
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

  # def finalize_second_ship
  #   ["horizontal",  "vertical"].sample
  #   if horizontal [2 up = 2 down].pop
  #     if valid place on grid
  #       if invalid up do down
  #         if valid place on grid
  #     if invalid do vertical
  #     elsif vertical [2 left, 2 right].sample
  #   else
  #     pick 2 left or 2 right or 1 left one right
  #
  #   # 1. pick horizontal vertical
  #   2. validates 3 spaces aviable
  #   3. rand place the 2 ship spaces
  #
  # end


end
