module PokerDice
  class Die
    FACE_VALUES = %w[ _ 9 10 J Q K A ]

    def initialize(numeric_value = nil)
      @numeric_value = numeric_value
    end

    def to_s
      roll! if @numeric_value.nil?
      FACE_VALUES[@numeric_value]
    end

    def roll!
      @numeric_value = random_numeric_value
    end

    private

    def random_numeric_value
      Random.rand(1..6)
    end
  end
end
