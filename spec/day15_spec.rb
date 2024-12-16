require "./days/day15/day15"
RSpec.describe Day15, "#solve" do
  describe "part 1" do
    it "works with sample" do
      str = File.read("./days/day15/sample")
      expect(Day15.part1(str)).to eq nil
    end

    it "works with input" do
      str = File.read("./days/day15/input")
      expect(Day15.part1(str)).to eq nil
    end
  end

  describe "part 2" do
    it "works with sample" do
      str = File.read("./days/day15/sample")
      expect(Day15.part2(str)).to eq nil
    end

    it "works with input" do
      str = File.read("./days/day15/input")
      expect(Day15.part2(str)).to eq nil
    end
  end
end
