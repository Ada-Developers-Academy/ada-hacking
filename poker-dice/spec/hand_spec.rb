require_relative '../lib/poker_dice'

describe PokerDice::Hand do
  def hand(*numeric_values)
    dice = numeric_values.map {|n| PokerDice::Die.new(n) }
    PokerDice::Hand.new(dice)
  end

  describe "scoring" do
    it "recognizes five of a kind" do
      expect( hand(1, 1, 1, 1, 1).description ).to eq( "Five of a kind" )
    end
  end
end

