require "minitest/autorun"
require_relative "robot"

class TestRobot < Minitest::Test
  def setup
    @x = nil
    @y = nil
    @facing = nil
  end

  def test_place_puts_robot_on_board
    place(0, 0, "NORTH")

    assert_equal(0, @x)
    assert_equal(0, @y)
    assert_equal("NORTH", @facing)
  end

  def test_other_orders_before_test_are_ignored
    move
    left

    assert_nil(@x)
    assert_nil(@y)
    assert_nil(@facing)
  end

  def test_cannot_place_robot_outside_of_the_board
    place(7, 8, "SOUTH")

    assert_nil(@x)
    assert_nil(@y)
    assert_nil(@facing)
  end

  def test_report_shows_current_robot_position_and_direction
    place(1, 2, "SOUTH")

    assert_equal("1,2,SOUTH", report)
  end

  def test_move_moves_robot_in_direction_it_is_facing
    place(0, 0, "NORTH")
    move

    assert_equal("0,1,NORTH", report)
  end

  def test_robot_cannot_move_when_it_puts_it_over_the_edge
    place(0, 0, "SOUTH")
    move

    assert_equal("0,0,SOUTH", report)
  end

  def test_when_robot_faces_north_left_turns_west
    place(0, 0, "NORTH")
    left

    assert_equal(0, 0, "WEST")
  end

  def test_when_robot_faces_north_right_turns_east
    place(0, 0, "NORTH")
    right

    assert_equal(0, 0, "EAST")
  end

  def test_when_robot_faces_west_left_turns_south
    place(0, 0, "WEST")
    left

    assert_equal(0, 0, "SOUTH")
  end

  def test_when_robot_faces_west_right_turns_north
    place(0, 0, "WEST")
    right

    assert_equal(0, 0, "NORTH")
  end

  def test_when_robot_faces_south_left_turns_east
    place(0, 0, "SOUTH")
    left

    assert_equal(0, 0, "EAST")
  end

  def test_when_robot_faces_south_right_turns_west
    place(0, 0, "SOUTH")
    right

    assert_equal(0, 0, "WEST")
  end

  def test_when_robot_faces_east_left_turns_north
    place(0, 0, "EAST")
    left

    assert_equal(0, 0, "NORTH")
  end

  def test_when_robot_faces_east_right_turns_south
    place(0, 0, "EAST")
    right

    assert_equal(0, 0, "SOUTH")
  end

  # def test_complex_instructions_1
  #   place 0, 0, "NORTH"
  #   move
  #   assert_equal("0,1,NORTH", report)
  # end
  #
  # def test_complex_instructions_2
  #   place 0, 0, "NORTH"
  #   left
  #   assert_equal("0,0,WEST", report)
  # end
  #
  # def test_complex_instructions_3
  #   place 1, 2, "EAST"
  #   move
  #   move
  #   left
  #   move
  #   assert_equal("3,3,NORTH", report)
  # end
end
