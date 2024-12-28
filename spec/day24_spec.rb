require "./days/day24/day24"
RSpec.describe Day24, "#solve" do
  describe "part 1" do
    xit "works with sample" do
      str = File.read("./days/day24/sample")
      expect(Day24.part1(str)).to eq 4
    end

    xit "works with sample2" do
      str = File.read("./days/day24/sample2")
      expect(Day24.part1(str)).to eq 2024
    end

    xit "works with input" do
      str = File.read("./days/day24/input")
      expect(Day24.part1(str)).to eq nil
    end
  end

  describe "part 2" do
    xit "works with sample" do
      str = File.read("./days/day24/sample")
      expect(Day24.part2(str)).to eq nil
    end

    xit "works with input" do
      str = File.read("./days/day24/input")
      expect(Day24.part2(str)).to eq nil
    end
  end
end
