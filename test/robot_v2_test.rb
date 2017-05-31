require "minitest/autorun"
require_relative "../robot_v2"

describe RobotV2 do
  before do
    @board = Board.new(x: 5, y: 5)
    @robot = RobotV2.new(board: @board)
  end

  describe "#place" do
    describe "when placed within the board" do
      it "places the robot on the board facing given direction" do
        @robot.place 1, 2, NORTH

        @robot.x.must_equal 1
        @robot.y.must_equal 2
        @robot.facing.must_equal NORTH
        @robot.placed.must_equal true
      end
    end

    describe "when placed outside the board" do
      it "ignores the command" do
        @robot.place 10, 10, NORTH

        @robot.x.must_be_nil
        @robot.y.must_be_nil
        @robot.facing.must_be_nil
        @robot.placed.must_equal false
      end
    end

    it "ignores other commands before place is called" do
      @robot.move
      @robot.left

      @robot.x.must_be_nil
      @robot.y.must_be_nil
      @robot.facing.must_be_nil
    end
  end

  describe "reporting position" do
    it "reports the position of robot" do
      @robot.place(3, 1, SOUTH)

      assert_output(/3,1,SOUTH/) { @robot.report }
    end

    it "does not report anything when robot was not placed yet" do
      @robot.report.must_be_nil
    end
  end

  describe "turning the robot" do
    describe "when robot faces north" do
      before do
        @robot.place(0, 0, NORTH)
      end

      it "turns west for left" do
        @robot.left

        @robot.facing.must_equal WEST
      end

      it "turns east for right" do
        @robot.right

        @robot.facing.must_equal EAST
      end
    end

    describe "when robot faces west" do
      before do
        @robot.place(0, 0, WEST)
      end

      it "turns south for left" do
        @robot.left

        @robot.facing.must_equal SOUTH
      end

      it "turns north for right" do
        @robot.right

        @robot.facing.must_equal NORTH
      end
    end

    describe "when robot faces south" do
      before do
        @robot.place(0, 0, SOUTH)
      end

      it "turns east for left" do
        @robot.left

        @robot.facing.must_equal EAST
      end

      it "turns west for right" do
        @robot.right

        @robot.facing.must_equal WEST
      end
    end

    describe "when robot faces east" do
      before do
        @robot.place(0, 0, EAST)
      end

      it "turns north for left" do
        @robot.left

        @robot.facing.must_equal NORTH
      end

      it "turns south for right" do
        @robot.right

        @robot.facing.must_equal SOUTH
      end
    end
  end

  describe "moving the robot" do
    describe "when it will not put the robot over the edge" do
      it "moves the robot in the position it is facing" do
        @robot.place(0, 0, NORTH)
        @robot.move

        @robot.x.must_equal 0
        @robot.y.must_equal 1
        @robot.facing.must_equal NORTH
      end
    end

    describe "when it will move robot over the edge" do
      it "ignores the command" do
        @robot.place(0, 0, SOUTH)
        @robot.move

        @robot.x.must_equal 0
        @robot.y.must_equal 0
        @robot.facing.must_equal SOUTH
      end

      it "works for the top edge" do
        @robot.place(0, 5, NORTH)
        @robot.move

        @robot.x.must_equal 0
        @robot.y.must_equal 5
        @robot.facing.must_equal NORTH
      end

      it "works when robot was moving" do
        @robot.place(1, 2, WEST)
        @robot.move

        @robot.x.must_equal 0
        @robot.y.must_equal 2
        @robot.facing.must_equal WEST

        @robot.move
        @robot.x.must_equal 0
        @robot.y.must_equal 2
        @robot.facing.must_equal WEST
      end

      it "allows further commands" do
        @robot.place(0, 5, NORTH)
        @robot.move

        @robot.x.must_equal 0
        @robot.y.must_equal 5
        @robot.facing.must_equal NORTH

        @robot.right
        @robot.move

        @robot.x.must_equal 1
        @robot.y.must_equal 5
        @robot.facing.must_equal EAST
      end
    end
  end

  describe "complex scenario" do
    it "follows more complex instructions" do
      @robot.place 1, 2, EAST
      @robot.move
      @robot.move
      @robot.left
      @robot.move

      assert_output(/3,3,NORTH/) { @robot.report }
    end
  end
end
