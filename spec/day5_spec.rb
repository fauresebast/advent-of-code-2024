require "./days/day5/day5"
RSpec.describe Day5, "#solve" do
  it "part 1 works with sample" do
    str = File.read("./days/day5/sample")
    expect(Day5.part1(str)).to eq 143
  end

  it "part 1 works with input" do
    str = File.read("./days/day5/input")
    expect(Day5.part1(str)).to eq 4924
  end

  it "part 2 works with sample" do
    str = File.read("./days/day5/sample")
    expect(Day5.part2(str)).to eq 123
  end

  it "part 2 works with input" do
    str = File.read("./days/day5/input")
    expect(Day5.part2(str)).to eq 6085
  end
end
