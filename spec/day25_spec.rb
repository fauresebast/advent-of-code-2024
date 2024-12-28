require "./days/day25/day25"
RSpec.describe Day25, "#solve" do
  describe "part 1" do
    xit "works with sample" do
      str = File.read("./days/day25/sample")
      expect(Day25.part1(str)).to eq 3
    end

    xit "works with input" do
      str = File.read("./days/day25/input")
      expect(Day25.part1(str)).to eq nil
    end
  end

  describe "part 2" do
    xit "works with sample" do
      str = File.read("./days/day25/sample")
      expect(Day25.part2(str)).to eq nil
    end

    xit "works with input" do
      str = File.read("./days/day25/input")
      expect(Day25.part2(str)).to eq nil
    end
  end
end
