require "./days/day4/day4"
RSpec.describe Day4, "#solve" do
  it "part 1 works with tiny" do
    str = File.read("./days/day4/tiny")
    expect(Day4.part1(str)).to eq 2
  end

  it "part 1 works with sample" do
    str = File.read("./days/day4/sample")
    expect(Day4.part1(str)).to eq 18
  end

  xit "part 1 works with input" do
    str = File.read("./days/day4/input")
    expect(Day4.part1(str)).to eq nil
  end

  xit "part 2 works with sample" do
    str = File.read("./days/day4/sample")
    expect(Day4.part2(str)).to eq nil
  end

  xit "part 2 works with input" do
    str = File.read("./days/day4/input")
    expect(Day4.part2(str)).to eq nil
  end
end
