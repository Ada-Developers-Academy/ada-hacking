require_relative '../lib/poker_dice'

describe PokerDice::Die do
  def die(numeric_value)
    PokerDice::Die.new(numeric_value)
  end

  describe "face values" do
    RSpec::Matchers.define :have_face_value_of do |expected|
      match do |actual|
        actual.to_s == expected
      end

      failure_message_for_should do |actual|
        "expected that #{actual.inspect} would have a face value of #{expected}"
      end
    end

    it "should be 9 when its numeric_value is 1" do
      expect( die(1) ).to have_face_value_of('9')
    end

    it "should be 10 when its numeric_value is 2" do
      expect( die(2) ).to have_face_value_of('10')
    end

    it "should be J when its numeric_value is 3" do
      expect( die(3) ).to have_face_value_of('J')
    end

    it "should be Q when its numeric_value is 4" do
      expect( die(4) ).to have_face_value_of('Q')
    end

    it "should be K when its numeric_value is 5" do
      expect( die(5) ).to have_face_value_of('K')
    end

    it "should be A when its numeric_value is 6" do
      expect( die(6) ).to have_face_value_of('A')
    end

  end
end
