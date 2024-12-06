require "./days/day6/day6"
RSpec.describe Day6, "#solve" do
  it "part 1 works with sample" do
    str = File.read("./days/day6/sample")
    expect(Day6.part1(str)).to eq 40
  end

  it "part 1 works with input" do
    str = File.read("./days/day6/input")
    expect(Day6.part1(str)).to eq 4977
  end

  xit "part 2 works with sample" do
    str = File.read("./days/day6/sample")
    expect(Day6.part2(str)).to eq 6
  end

  xit "part 2 works with input" do
    str = File.read("./days/day6/input")
    expect(Day6.part2(str)).to eq nil
  end
end
