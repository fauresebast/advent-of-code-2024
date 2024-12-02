require "./days/day2/day2"
RSpec.describe Day2, "#solve" do
  it "part 1 works with sample" do
    str = File.read("./days/day2/sample")
    expect(Day2.part1(str)).to eq 2
  end

  it "part 1 works with input" do
    str = File.read("./days/day2/input")
    expect(Day2.part1(str)).to eq 432
  end

  it "part 2 works with sample" do
    str = File.read("./days/day2/sample")
    expect(Day2.part2(str)).to eq 4
  end

  it "part 2 works with input" do
    str = File.read("./days/day2/input")
    expect(Day2.part2(str)).to eq 488
  end
end
