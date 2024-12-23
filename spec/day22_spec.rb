require "./days/day22/day22"
RSpec.describe Day22, "#solve" do
  describe "part 1" do
    it "works with sample" do
      str = File.read("./days/day22/sample")
      expect(Day22.part1(str)).to eq 37327623
    end

    it "works with input" do
      str = File.read("./days/day22/input")
      expect(Day22.part1(str)).to eq 16953639210
    end
  end

  describe "part 2" do
    it "works with sample2" do
      str = File.read("./days/day22/sample2")
      expect(Day22.part2(str)).to eq 23
    end

    xit "works with input" do
      str = File.read("./days/day22/input")
      expect(Day22.part2(str)).to eq nil
    end
  end
end
