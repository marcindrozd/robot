require "minitest/autorun"
require_relative "../board"

describe Board do
  describe "when no params given" do
    it "uses the defaults" do
      board = Board.new

      board.max_x.wont_be_nil
      board.max_y.wont_be_nil
    end
  end

  describe "when params given" do
    it "uses the params for max x and y" do
      board = Board.new(x: 10, y: 12)

      board.max_x.must_equal 10
      board.max_y.must_equal 12
    end
  end

  describe "#element_outside?" do
    before do
      @board = Board.new(x: 3, y: 3)
    end

    describe "when given coordinates are smaller than min x" do
      it "returns true" do
        @board.element_outside?(-1, 1).must_equal true
      end
    end

    describe "when given coordinates are larger than max x" do
      it "returns true" do
        @board.element_outside?(7, 1).must_equal true
      end
    end

    describe "when given coordinates are smaller than min y" do
      it "returns true" do
        @board.element_outside?(1, -2).must_equal true
      end
    end

    describe "when given coordinates are larger than max y" do
      it "returns true" do
        @board.element_outside?(1, 8).must_equal true
      end
    end

    describe "when given coordinates are within the range of x and y" do
      it "returns true" do
        @board.element_outside?(1, 2).must_equal false
      end
    end
  end
end
