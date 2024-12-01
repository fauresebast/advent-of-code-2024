require "./days/day1/day1"
RSpec.describe Day1, "#solve" do
  it "part 1 works with sample" do
    str = File.read("./days/day1/sample")
    expect(Day1.part1(str)).to eq 11
  end

  it "part 1 works with input" do
    str = File.read("./days/day1/input")
    expect(Day1.part1(str)).to eq 2166959
  end

  it "part 2 works with sample" do
    str = File.read("./days/day1/sample")
    expect(Day1.part2(str)).to eq 31
  end

  it "part 2 works with input" do
    str = File.read("./days/day1/input")
    expect(Day1.part2(str)).to eq 23741109
  end
end
