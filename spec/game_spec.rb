require '../board'
require '../player'

describe "board" do
  let(:board) {Board.new}
  let(:player1) {Player.new(:name => "Sam", :token => "X", :history => [])}
  let(:location_good) {3}
  let(:location_bad) {124}
  it "can change a cell" do
    expect(board.modify_board(player1,location_good)).to eq "X"#&&(be_a String)
  end

  it "rejects changing an invalid cell" do
    expect{board.modify_board(player1,location_bad)}.to raise_error(RuntimeError, "ERROR: invalid location was provided")
  end

end
