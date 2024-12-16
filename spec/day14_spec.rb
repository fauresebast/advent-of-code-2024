require "./days/day14/day14"
RSpec.describe Day14, "#solve" do
  describe "part 1" do
    xit "works with sample" do
      str = File.read("./days/day14/sample")
      expect(Day14.part1(str, 11, 7)).to eq 12
    end

    xit "works with input" do
      str = File.read("./days/day14/input")
      expect(Day14.part1(str, 101, 103)).to eq nil
    end
  end

  describe "part 2" do
    xit "works with sample" do
      str = File.read("./days/day14/sample")
      expect(Day14.part2(str)).to eq nil
    end

    xit "works with input" do
      str = File.read("./days/day14/input")
      expect(Day14.part2(str)).to eq nil
    end
  end
end
