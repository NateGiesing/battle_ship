require "./test/test_helper"


class ComputerTest < Minitest::Test

  def test_it_picks_column
    computer = Computer.new
    column = computer.column_picker
    expected = [1, 2, 3, 4].include?(column)

    assert expected
  end

  def test_it_picks_row
    computer = Computer.new
    row = computer.row_picker
    expected = [:a, :b, :c, :d].include?(row)

    assert expected
  end

  def test_places_the_first_placement
    computer = Computer.new
    row = :b
    column = 3
    computer.grid_writer(row, column, "$")

    assert_equal "$", computer.grid[:b][3]
 end

 def test_if_it_places_right_location_for_second_placement
    computer = Computer.new
    row = :b
    column = 3
    computer.grid_writer(row, column, "$")
    # row = :c
    # column = 4
    computer.ship_one_second_placement(row, column)

    expected = [computer.grid[:c][3], computer.grid[:a][3], computer.grid[:b][2],computer.grid[:b][4]].include?("$")
    assert expected
  end

  # def test_wrong_second_placemnt
  #   computer = Computer.new
  #   computer.grid[:b][3] = "$"
  #   computer.grid[:d][4] = "$"
  #   computer.first_position
  #
  # end

  def test_second_ship
    computer = Computer.new
    computer.grid[:b][3] = "$"

    assert_equal false, computer.position_validation(:b, 3)
    assert_equal true, computer.position_validation(:b, 4)
  end

  def test_second_ship_first_placement
    skip
    computer = Computer.new
    computer.grid[:b][3] = "$"
    computer.grid[:c][3] = "$"
    result = computer.first_position
    assert_equal "&", computer.grid[result.first][result.last]
    refute result == [:b][3]
    refute result == [:c][3]
  end

  def test_finalize_second_ship
    skip
    computer = Computer.new
    # computer.ship_two
    computer.grid[:b][3] = "&"
    computer.grid[:c][3] = "&"
    computer.grid[:d][3] = "&"
    # computer.ship_two
    # require "pry"; binding.pry
    assert_equal  , computer.finalize_second_ship
    # assert computer.grid[:a][2] == "&" || computer.grid[:d][2] == "&"
  end




  # def test_for_valid_spot_on_second_ship
  #   computer = Computr.new
  #   row =
  # end

end
