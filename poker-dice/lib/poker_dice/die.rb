module PokerDice
  class Die
    FACE_VALUES = %w[ _ 9 10 J Q K A ]
    LEGAL_FACE_VALUES = FACE_VALUES[1..-1]
    attr_reader :numeric_value

    def initialize(value = nil)
      @numeric_value =
        case
        when LEGAL_FACE_VALUES.include?(value)
          FACE_VALUES.index(value)
        when value.kind_of?(Fixnum) || value.nil?
          value
        else
          raise ArgumentError
        end
    end

    def to_s
      roll! if @numeric_value.nil?
      FACE_VALUES[@numeric_value]
    end
    alias face_value to_s

    def roll!
      @numeric_value = random_numeric_value
    end

    private

    def random_numeric_value
      Random.rand(1..6)
    end
  end
end
