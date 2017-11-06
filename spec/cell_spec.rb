require "rspec"
require File.expand_path("../../cell", __FILE__)

describe Cell do
  before(:each) do
    @cell = Cell.new(1)
  end

  it "Is empty when it's created" do
    expect(@cell.empty?).to be(true)
  end

  it "Can be marked" do
    @cell.put_marker "X"
    expect(@cell).to be_marked
  end
end
