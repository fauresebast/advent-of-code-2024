require "./days/day3/day3"
RSpec.describe Day3, "#solve" do
  it "part 1 works with sample" do
    str = File.read("./days/day3/sample")
    expect(Day3.part1(str)).to eq 161
  end

  it "part 1 works with input" do
    str = File.read("./days/day3/input")
    expect(Day3.part1(str)).to eq 162813399
  end

  it "part 2 works with sample" do
    str = File.read("./days/day3/sample_part_2")
    expect(Day3.part2(str)).to eq 48
  end

  it "part 2 works with input" do
    str = File.read("./days/day3/input")
    expect(Day3.part2(str)).to eq 53783319
  end
end
