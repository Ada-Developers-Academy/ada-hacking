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

    it "recognizes four of a kind" do
      expect( hand(1, 1, 2, 1, 1).description ).to eq( "Four of a kind" )
    end

    it "recognizes a full house" do
      expect( hand(1, 1, 2, 2, 2).description ).to eq( "Full house" )
    end

    it "recognizes a straight" do
      expect( hand(1, 2, 3, 4, 5).description ).to eq( "Straight" )
      expect( hand(2, 3, 4, 5, 6).description ).to eq( "Straight" )
    end

    it "recognizes three of a kind"
    it "recognizes two pair(s, dammit)"
    it "recognizes one pair"
    it "recognizes a bust (high card, no pair, no straight)"
  end

  describe "string representation" do
    it "works for five of a kind" do
      expect( hand(1, 1, 1, 1, 1).to_s ).to eq( "9 9 9 9 9" )
    end

    it "works for four of a kind" do
      expect( hand(1, 1, 2, 1, 1).to_s ).to eq( "9 9 10 9 9" )
    end

    it "works for a full house" do
      expect( hand(1, 1, 2, 2, 2).to_s ).to eq( "9 9 10 10 10" )
    end

    it "works for a straight" do
      expect( hand(1, 2, 3, 4, 5).to_s ).to eq( "9 10 J Q K" )
    end
  end

  describe "rerolling some dice" do
    it "is possible" do
      # Start with a straight
      loaded_dice = %w[ 9 10 J Q K ].map {|face_value|
        double("PokerDice::Die", face_value: face_value)
      }
      hand = PokerDice::Hand.new(loaded_dice)

      expect( hand.to_s ).to eq("9 10 J Q K") # Sanity check

      d1, _, d3, _, _ = *loaded_dice

      # First, the hand should reroll dice #1 and #3
      expect(d1).to receive(:roll!).once
      expect(d3).to receive(:roll!).once

      # Then, the hand should ask *all* the dice for their face values again
      expect(d1).to receive(:face_value).and_return('10')
      expect(d3).to receive(:face_value).and_return('10')

      hand.reroll_dice(1, 3)

      expect( hand.to_s ).to eq("10 10 10 Q K")
    end
  end
end

