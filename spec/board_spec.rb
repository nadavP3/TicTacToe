require '../board'

describe "board tests" do
  let(:board) {Board.new}
  let(:entries) {board.initialize}

  it "is a board" do
    expect(board).to be_a(Board)
  end

  it "has winning combos" do
    expect(board.wining_combos).to be_a(Array)
  end

  it "has correct winning combos" do
    expect(board.wining_combos).to eq [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  end

  it "has entries" do
    expect(board.entries).to be_a(Array)
  end

  it "has correct initial values" do
    expect(board.entries).to eq ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end
end
