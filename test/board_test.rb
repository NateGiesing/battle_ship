require './test/test_helper'

class BoardTest < Minitest::Test


  def test_does_it_make_a_grid
      board = Board.new
      actual = board.grid
      expected =   {
      bs: [" ", " *BATTLESHIP*", " "],
      n:  [" ", "1", "2", "3", "4"],
      a:  ["A", " ", " ", " ", " "],
      b:  ["B", " ", " ", " ", " "],
      c:  ["C", " ", " ", " ", " "],
      d:  ["D", " ", " ", " ", " "]
      }

      assert_equal expected, actual
  end

  def test_cant_place_on_invalid_board_area
    board = Board.new
    row = "e"
    column = "5"

    refute board.grid_validator(row, column)
  end

  def test_can_only_place_on_valid_board_area
    board = Board.new
    row = "a"
    column = "3"
    assert board.grid_validator(row, column)
  end
end
