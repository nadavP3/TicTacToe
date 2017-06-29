require '../player'

describe "player" do
  let(:player) {Player.new(:name => "Sam", :token => "O", :history => [])}

  it "is a player" do
    expect(player).to be_a(Player)
  end

  it "has a name" do
    expect(player.name).to eq("Sam")
  end

  it "has a token" do
    expect(player.token).to eq("O")
  end
end
