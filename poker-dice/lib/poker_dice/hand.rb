module PokerDice
  class Hand
    attr_reader :dice

    def initialize(dice)
      raise ArgumentError unless dice.length == 5
      @dice = dice
    end

    def description
      case
      when dice.map(&:to_s).uniq.length == 1
        "Five of a kind"
      end
    end
  end
end
