require "./days/day18/day18"
RSpec.describe Day18, "#solve" do
  describe "part 1" do
    it "works with sample" do
      str = File.read("./days/day18/sample")
      expect(Day18.part1(str, 7, 12)).to eq 22
    end

    it "works with input" do
      str = File.read("./days/day18/input")
      expect(Day18.part1(str, 71, 1024)).to eq 234
    end
  end

  describe "part 2" do
    it "works with sample" do
      str = File.read("./days/day18/sample")
      expect(Day18.part2(str, 7)).to eq [6, 1]
    end

    it "works with input" do
      str = File.read("./days/day18/input")
      expect(Day18.part2(str, 71)).to eq [58, 19]
    end
  end
end
