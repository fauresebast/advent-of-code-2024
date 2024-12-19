require "./days/day19/day19"
RSpec.describe Day19, "#solve" do
  describe "part 1" do
    it "works with sample" do
      str = File.read("./days/day19/sample")
      expect(Day19.part1(str)).to eq 6
    end

    it "works with input" do
      str = File.read("./days/day19/input")
      expect(Day19.part1(str)).to eq 338
    end
  end

  describe "part 2" do
    it "works with sample" do
      str = File.read("./days/day19/sample")
      expect(Day19.part2(str)).to eq 16
    end

    it "works with input" do
      str = File.read("./days/day19/input")
      expect(Day19.part2(str)).to eq 841533074412361
    end
  end
end
