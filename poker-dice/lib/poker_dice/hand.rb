module PokerDice
  class Hand
    attr_reader :dice

    def initialize(dice)
      raise ArgumentError unless dice.length == 5
      @dice = dice
    end

    def description
      Classifier.new(dice).description
    end

    def to_s
      dice.map(&:face_value).join(' ')
    end

    def reroll_dice(*numbers_to_reroll)
      numbers_to_reroll.each do |n|
        index = n - 1
        dice[index].roll!
      end
    end

    class Classifier
      attr_reader :dice

      def initialize(dice)
        @dice = dice
      end

      def description
        case
        when five_of_a_kind?  ; "Five of a kind"
        when four_of_a_kind?  ; "Four of a kind"
        when full_house?      ; "Full house"
        when straight?        ; "Straight"
        when three_of_a_kind? ; "Three of a kind"
        when two_pair?        ; "Two pair"
        when one_pair?        ; "One pair"
        else                    "Bust"
        end
      end

      private

      def counts
        counts = Hash.new {|h,k| h[k] = 0 }
        dice.each do |die|
          counts[die.face_value] += 1
        end
        counts
      end

      def five_of_a_kind?
        counts.values == [5]
      end

      def four_of_a_kind?
        counts.values.sort == [1, 4]
      end

      def full_house?
        counts.values.sort == [2, 3]
      end

      def straight?
        numbers = dice.map(&:numeric_value).sort
        numbers == (1..5).to_a || numbers == (2..6).to_a
      end

      def three_of_a_kind?
        counts.values.sort == [1, 1, 3]
      end

      def two_pair?
        counts.values.sort == [1, 2, 2]
      end

      def one_pair?
        counts.values.sort == [1, 1, 1, 2]
      end
    end
  end
end
