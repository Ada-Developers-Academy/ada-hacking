require_relative '../lib/poker_dice'

describe PokerDice::Die do
  def die(numeric_value)
    PokerDice::Die.new(numeric_value)
  end

  it "should have a face value of 9 when its numeric value is 1" do
    expect( die(1).to_s ).to eq('9')
  end

  it "should have a face value of 10 when its numeric value is 2" do
    expect( die(2).to_s ).to eq('10')
  end
end
