require "./days/day8/day8"
RSpec.describe Day8, "#solve" do
  it "part 1 works with sample" do
    str = File.read("./days/day8/sample")
    expect(Day8.part1(str)).to eq 14
  end

  it "part 1 works with input" do
    str = File.read("./days/day8/input")
    expect(Day8.part1(str)).to eq 280
  end

  it "part 2 works with sample" do
    str = File.read("./days/day8/sample")
    expect(Day8.part2(str)).to eq 34
  end

  it "part 2 works with input" do
    str = File.read("./days/day8/input")
    expect(Day8.part2(str)).to eq 958
  end
end
