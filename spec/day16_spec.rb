require "./days/day16/day16"
RSpec.describe Day16, "#solve" do
  describe "part 1" do
    it "works with sample1" do
      str = File.read("./days/day16/sample1")
      expect(Day16.part1(str)).to eq 7036
    end

    it "works with sample2" do
      str = File.read("./days/day16/sample2")
      expect(Day16.part1(str)).to eq 11048
    end

    it "works with input" do
      str = File.read("./days/day16/input")
      expect(Day16.part1(str)).to eq 73432
    end
  end

  describe "part 2" do
    xit "works with sample1" do
      str = File.read("./days/day16/sample1")
      expect(Day16.part2(str)).to eq 45
    end

    xit "works with sample2" do
      str = File.read("./days/day16/sample2")
      expect(Day16.part2(str)).to eq 64
    end

    xit "works with input" do
      str = File.read("./days/day16/input")
      expect(Day16.part2(str)).to eq nil
    end
  end
end
