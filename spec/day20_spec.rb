require "./days/day20/day20"
RSpec.describe Day20, "#solve" do
  describe "part 1" do
    it "works with sample" do
      str = File.read("./days/day20/sample")
      expect(Day20.part1(str)).to eq 0
    end

    it "works with input" do
      str = File.read("./days/day20/input")
      expect(Day20.part1(str)).to eq 1293
    end
  end

  describe "part 2" do
    xit "works with sample" do
      str = File.read("./days/day20/sample")
      expect(Day20.part2(str)).to eq 285
    end

    xit "works with input" do
      str = File.read("./days/day20/input")
      expect(Day20.part2(str)).to eq nil
    end
  end
end
