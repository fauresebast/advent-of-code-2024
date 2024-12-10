require "./days/day10/day10"
RSpec.describe Day10, "#solve" do
  describe "part1" do
    it "works with sample Y shape" do
      str = File.read("./days/day10/sample_y_shape")
      expect(Day10.part1(str)).to eq 2
    end

    it "works with sample score 4" do
      str = File.read("./days/day10/sample_score4")
      expect(Day10.part1(str)).to eq 4
    end

    it "works with sample score 3" do
      str = File.read("./days/day10/sample_score3")
      expect(Day10.part1(str)).to eq 3
    end

    it "works with sample" do
      str = File.read("./days/day10/sample")
      expect(Day10.part1(str)).to eq 36
    end

    it "works with input" do
      str = File.read("./days/day10/input")
      expect(Day10.part1(str)).to eq 694
    end
  end

  describe "part2" do
    it "works with sample score 3" do
      str = File.read("./days/day10/sample_part2_score3")
      expect(Day10.part2(str)).to eq 3
    end

    it "works with sample score 13" do
      str = File.read("./days/day10/sample_part2_score13")
      expect(Day10.part2(str)).to eq 13
    end

    it "works with sample score 227" do
      str = File.read("./days/day10/sample_part2_score227")
      expect(Day10.part2(str)).to eq 227
    end

    it "works with sample" do
      str = File.read("./days/day10/sample")
      expect(Day10.part2(str)).to eq 81
    end

    it "works with input" do
      str = File.read("./days/day10/input")
      expect(Day10.part2(str)).to eq 1497
    end
  end
end
