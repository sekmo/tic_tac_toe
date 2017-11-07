require File.expand_path("../../player", __FILE__)

describe Player do
  before do
    @player = Player.new("Tom", "X")
  end

  it "Returns the name" do
    expect(@player.name).to eq("Tom")
  end

  it "Returns the marker" do
    expect(@player.marker).to eq("X")
  end
end
