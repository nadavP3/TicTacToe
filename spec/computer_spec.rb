require '../computer'
include Computer

describe "computer's cell choosing logic tests" do

  it "computer chooses cell \#6 to win(horizontal)" do
    expect(move_priority([1,2,9],[4,5])).to eq 6
  end

  it "computer chooses cell \#9(corner) to win(vertical)" do
    expect(move_priority([1,2,4],[3,6])).to eq 9
  end

  it "computer chooses cell \#5(center) to win(\/ shape)" do
    expect(move_priority([1,2,4],[7,3])).to eq 5
  end

  it "computer chooses cell \#1(corner) to block player from wining(horizontal)" do
    expect(move_priority([6,2,3],[6,9])).to eq 1
  end

  it "computer chooses cell \#7(corner) to block player from wining(vertical)" do
    expect(move_priority([1,2,4],[5,3])).to eq 7
  end

  it "computer chooses cell \#5(center) to block player from winning(\\ shape)" do
    expect(move_priority([1,9,4],[7,8])).to eq 5
  end

  it "computer chooses cell \#6 as its the last cell left" do
    expect(move_priority([1,7,5,3],[2,4,9,8])).to eq 6
  end

  it "computer chooses nothing (nil) since somehow its computer's turn and entire board is filled up" do
    expect(move_priority([1,7,5,3,6],[2,4,9,8])).to be nil
  end

end
