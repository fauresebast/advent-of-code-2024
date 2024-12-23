require "./days/day23/day23"
RSpec.describe Day23, "#solve" do
  describe "part 1" do
    it "works with sample" do
      str = File.read("./days/day23/sample")
      expect(Day23.part1(str)).to eq nil
    end

    it "works with input" do
      str = File.read("./days/day23/input")
      expect(Day23.part1(str)).to eq nil
    end
  end

  describe "part 2" do
    it "works with sample" do
      str = File.read("./days/day23/sample")
      expect(Day23.part2(str)).to eq nil
    end

    it "works with input" do
      str = File.read("./days/day23/input")
      expect(Day23.part2(str)).to eq nil
    end
  end
end
