require_relative '../lib/poker_dice'

describe PokerDice::Die do
  def die(numeric_value)
    PokerDice::Die.new(numeric_value)
  end

  RSpec::Matchers.define :have_face_value_of do |expected|
    match do |actual|
      actual.to_s == expected
    end

    failure_message_for_should do |actual|
      "expected that #{actual.inspect} would have a face value of #{expected}"
    end
  end

  it "should have a face value of 9 when its numeric value is 1" do
    expect( die(1) ).to have_face_value_of('9')
  end

  it "should have a face value of 10 when its numeric value is 2" do
    expect( die(2) ).to have_face_value_of('10')
  end

  it "should have a face value of J when its numeric value is 3" do
    expect( die(3) ).to have_face_value_of('J')
  end

  it "should have a face value of Q when its numeric value is 4" do
    expect( die(4) ).to have_face_value_of('Q')
  end

  it "should have a face value of K when its numeric value is 5" do
    expect( die(5) ).to have_face_value_of('K')
  end

  it "should have a face value of A when its numeric value is 6" do
    expect( die(6) ).to have_face_value_of('A')
  end
end
