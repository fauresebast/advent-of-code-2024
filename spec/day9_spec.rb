require "./days/day9/day9"
RSpec.describe Day9, "#solve" do
  it "part 1 works with sample" do
    str = File.read("./days/day9/sample")
    expect(Day9.part1(str)).to eq 1928
  end

  it "part 1 works with input" do
    str = File.read("./days/day9/input")
    expect(Day9.part1(str)).to eq 6519155389266
  end

  it "part 2 works with sample" do
    str = File.read("./days/day9/sample")
    expect(Day9.part2(str)).to eq 2858
  end

  xit "part 2 works with input" do
    str = File.read("./days/day9/input")
    expect(Day9.part2(str)).to eq nil
  end
end
