require "rspec"
require File.expand_path("../../board", __FILE__)

describe Board do
  before(:each) do
    @board = Board.new
  end

  it "Is empty when it's created" do
    expect(@board).to be_empty
  end

  it "Is not full when it's created" do
    expect(@board).not_to be_full
  end

  it "Is full after marking all the cells" do
    @board.drop_marker_at(1, "X")
    @board.drop_marker_at(2, "X")
    @board.drop_marker_at(3, "X")
    @board.drop_marker_at(4, "X")
    @board.drop_marker_at(5, "X")
    @board.drop_marker_at(6, "X")
    @board.drop_marker_at(7, "X")
    @board.drop_marker_at(8, "X")
    expect { @board.drop_marker_at(9, "X") }.to change { @board.full? }.from(false).to(true)
  end

  it "Can't be dropped a marker on a marked cell" do
    @board.drop_marker_at(1, "X")
    expect(@board.drop_marker_at(1, "X")).to be(false)
  end

  it "returns the rows" do
    @board.drop_marker_at(2, "O")
    @board.drop_marker_at(3, "X")
    @board.drop_marker_at(4, "O")
    @board.drop_marker_at(6, "O")
    @board.drop_marker_at(8, "O")
    @board.drop_marker_at(9, "X")
    expect(@board.rows[0].map { |cell| cell.to_s }).to match_array([1, "O", "X"])
    expect(@board.rows[1].map { |cell| cell.to_s }).to match_array(["O", 5, "O"])
    expect(@board.rows[2].map { |cell| cell.to_s }).to match_array([7, "O", "X"])
  end


  it "Tells if there is a winning combination" do
    @board.drop_marker_at(1, "X")
    @board.drop_marker_at(2, "X")
    expect(@board.has_winning_combinations?).to be(false)
    #expect { @board.drop_marker_at(3, "X") }.to change { @board.has_three_equal_markers? }.from(false).to(true)
  end
end
