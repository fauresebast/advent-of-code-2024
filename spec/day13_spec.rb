require "./days/day13/day13"
RSpec.describe Day13, "#solve" do
  describe "part 1" do
    xit "works with sample" do
      str = File.read("./days/day13/sample")
      expect(Day13.part1(str)).to eq 480
    end

    xit "works with input" do
      str = File.read("./days/day13/input")
      expect(Day13.part1(str)).to eq nil
    end
  end

  describe "part 2" do
    xit "works with sample" do
      str = File.read("./days/day13/sample")
      expect(Day13.part2(str)).to eq nil
    end

    xit "works with input" do
      str = File.read("./days/day13/input")
      expect(Day13.part2(str)).to eq nil
    end
  end
end
