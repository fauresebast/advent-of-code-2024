require "./days/day21/day21"
RSpec.describe Day21, "#solve" do
  describe "part 1" do
    xit "works with sample" do
      str = File.read("./days/day21/sample")
      expect(Day21.part1(str)).to eq nil
    end

    xit "works with input" do
      str = File.read("./days/day21/input")
      expect(Day21.part1(str)).to eq nil
    end
  end

  describe "part 2" do
    xit "works with sample" do
      str = File.read("./days/day21/sample")
      expect(Day21.part2(str)).to eq nil
    end

    xit "works with input" do
      str = File.read("./days/day21/input")
      expect(Day21.part2(str)).to eq nil
    end
  end
end
