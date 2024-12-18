require "./days/day17/day17"
RSpec.describe Day17, "#solve" do
  describe "part 1" do
    it "works with sample" do
      str = File.read("./days/day17/sample")
      expect(Day17.part1(str)).to eq "4,6,3,5,6,3,5,2,1,0"
    end

    it "works with input" do
      str = File.read("./days/day17/input")
      expect(Day17.part1(str)).to eq "3,6,3,7,0,7,0,3,0"
    end
  end

  describe "part 2" do
    xit "works with sample2" do
      str = File.read("./days/day17/sample2")
      expect(Day17.part2(str, 117440)).to eq "0,3,5,4,3,0"
    end

    # 2,4,1,5,7,5,1,6,0,3,4,6,5,5,3,0
    xit "works with input" do
      str = File.read("./days/day17/input")
      expect(Day17.part2(str, 175_000_000_000_000)).to eq nil
    end
  end
end
