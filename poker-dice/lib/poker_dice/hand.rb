module PokerDice
  class Hand
    attr_reader :dice

    def initialize(dice)
      raise ArgumentError unless dice.length == 5
      @dice = dice
    end

    def description
      case
      when counts.length == 1 && counts.values.first == 5
        "Five of a kind"
      when counts.length == 2 && counts.values.max == 4
        "Four of a kind"
      when counts.length == 2 && counts.values.max == 3
        "Full house"
      end
    end

    def counts
      counts = Hash.new {|h,k| h[k] = 0 }
      dice.each do |die|
        counts[die.face_value] += 1
      end
      counts
    end
  end
end
