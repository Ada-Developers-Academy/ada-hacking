require_relative '../lib/poker_dice'

describe PokerDice::Die do
  def die(numeric_value)
    PokerDice::Die.new(numeric_value)
  end

  it "should have a face value of 9 when its numeric value is 1" do
    nine = die(1)
    expect( nine.to_s ).to eq('9')
  end
end
