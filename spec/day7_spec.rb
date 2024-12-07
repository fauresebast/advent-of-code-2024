require "./days/day7/day7"
RSpec.describe Day7, "#solve" do
  it "part 1 works with sample" do
    str = File.read("./days/day7/sample")
    expect(Day7.part1(str)).to eq 3749
  end

  it "part 1 works with input" do
    str = File.read("./days/day7/input")
    expect(Day7.part1(str)).to eq 1298300076754
  end

  it "part 2 works with sample" do
    str = File.read("./days/day7/sample")
    expect(Day7.part2(str)).to eq 11387
  end

  it "part 2 works with input" do
    str = File.read("./days/day7/input")
    expect(Day7.part2(str)).to eq nil
  end
end
