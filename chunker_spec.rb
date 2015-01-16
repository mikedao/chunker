require_relative 'chunker.rb'
describe Chunker do

  before(:each) do
    @string = "Rich thinks a single enumerable can solve this."
  end

  it "returns an array of one when given a single letter" do
    result = Chunker.chunk("a")
    expect(result).to eq(["a"])
  end

  it "returns a single element when you give it five characters" do
    result = Chunker.chunk("house")
    expect(result).to eq(["house"])
  end

  it "can handle leftovers" do
    result = Chunker.chunk("houses")
    expect(result).to eq(["house", "s"])
  end

  it "can split a large string into chunks of five" do
    result = Chunker.chunk(@string)
    expect(result).to eq(["Rich ", "think", "s a s", "ingle", " enum", "erabl", "e can", " solv", "e thi", "s."])
  end

  it "can chunk into threes" do
    result = Chunker.chunk("houses", 3)
    expect(result).to eq(["hou","ses"])
  end

  it "can chunk into threes with leftovers" do
    result = Chunker.chunk("houseses", 3)
    assert_equal ["hou", "ses", "es"]
  end


end




