require 'forwardable'
class Calculator
  def add(*numbers)
    numbers.flatten.inject(0, &:+)
  end

  def subtract(*numbers)
    numbers.inject(numbers.shift, &:-)
  end

  def multiply(*numbers)
    numbers.inject(1, &:*)
  end

  def divide(*numbers)
    numbers.inject(numbers.shift, &:/)
  end

  def evaluate(expression)
    accumulator = nil
    value, operator = nil, nil
    tokenizer = Tokenizer.new(expression)
    until tokenizer.empty?
      case tokenizer.first
      when /\d+/          # Integer
        value = tokenizer.shift.to_i  # consume the token, then...
        case
        when accumulator.nil? # should only be the first time through
          accumulator = value
        when operator.nil?
          raise "I don't understand #{expression.inspect}"
        else
          accumulator = accumulator.send(operator, value)
        end
      when /[\+\-\*\/]/   # Operator
        operator = tokenizer.shift.to_sym # consume the token
      else
        raise "I don't understand #{expression.inspect}"
      end
    end
    accumulator
  end

  class Tokenizer
    def initialize(string)
      @string = string
    end

    extend Forwardable
    def_delegators :tokens, :empty?, :first, :shift

    private

    def tokens
      @tokens ||=
        begin
          @string.gsub(/\s+/, '').split(/\b/)
        end
    end
  end
end
