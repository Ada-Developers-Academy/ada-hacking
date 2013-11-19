module PokerDice
  class Die
    FACE_VALUES = %w[ _ 9 10 J Q K A ]

    def initialize(numeric_value)
      @numeric_value = numeric_value
    end

    def to_s
      FACE_VALUES[@numeric_value]
    end
  end
end
