require File.expand_path("../../game", __FILE__)

describe Game do
  before(:each) do
    allow_any_instance_of(Game).to receive(:ask_player_names).and_return(["Francesco", "Chiara"])
    @game = Game.new
  end

  it "Starts out with an empty board" do
    expect(@game.board.empty?).to be(true)
  end

  it "Starts out with a `not finished` status" do
    expect(@game.status).to eq("not finished")
  end
end
