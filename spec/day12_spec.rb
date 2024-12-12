require "./days/day12/day12"
RSpec.describe Day12, "#solve" do
  describe "part 1" do
    it "works with sample" do
      str = File.read("./days/day12/sample")
      expect(Day12.part1(str)).to eq 1930
    end

    it "works with input" do
      str = File.read("./days/day12/input")
      expect(Day12.part1(str)).to eq 1344578
    end
  end

  describe "part 2" do
    it "works with sample_simple" do
      str = File.read("./days/day12/sample_simple")
      expect(Day12.part2(str)).to eq 80
    end

    it "works with sample_X&O" do
      str = File.read("./days/day12/sample_X&O")
      expect(Day12.part2(str)).to eq 436
    end

    it "works with sample_E_shape" do
      str = File.read("./days/day12/sample_E_shape")
      expect(Day12.part2(str)).to eq 236
    end

    it "works with sample_A&B" do
      str = File.read("./days/day12/sample_A&B")
      expect(Day12.part2(str)).to eq 368
    end

    it "works with sample" do
      str = File.read("./days/day12/sample")
      expect(Day12.part2(str)).to eq 1206
    end

    it "works with input" do
      str = File.read("./days/day12/input")
      expect(Day12.part2(str)).to eq 814302
    end
  end
end
