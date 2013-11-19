# TO RUN THIS:
#   $ rspec calculator_spec.rb
# YOU MAY NEED TO:
#   $ gem install rspec  # (and get v 2.14 or higher)

require_relative 'calculator'

describe Calculator do
  let(:calculator) { Calculator.new }

  describe "addition" do
    it "puts two and two together" do
      expect( calculator.add(2, 2) ).to eq(4)
    end

    it "puts two and two and two together" do
      expect( calculator.add(2, 2, 2) ).to eq(6)
    end
  end

  describe "subtraction" do
    it "takes one from two" do
      expect( calculator.subtract(2, 1) ).to eq(1)
    end

    it "subtracts all subsequent arguments from the first one" do
      expect( calculator.subtract(13, 8, 5, 3, 2, 1, 1) ).to eq(-7)
    end
  end

  # IF YOU'RE BORED...
  describe "parsing for fun and profit", pending: true do
    it "does simple addition" do
      expect( calculator.evaluate("2+2") ).to eq(4)
    end

    it "copes well with spaces" do
      expect( calculator.evaluate("  2    + 2") ).to eq(4)
    end

    it "understands order of operations" do
      expect( calculator.evaluate("2+2*5") ).to eq(12)
    end
  end
end
