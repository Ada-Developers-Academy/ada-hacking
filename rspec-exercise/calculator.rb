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
    tokens = expression.gsub(/\s+/, '').split(/\b/)
    until tokens.empty?
      case tokens.first
      when /\d+/          # Integer
        value = tokens.shift.to_i  # consume the token, then...
        case
        when accumulator.nil? # should only be the first time through
          accumulator = value
        when operator.nil?
          raise "I don't understand #{expression.inspect}"
        else
          accumulator = accumulator.send(operator, value)
        end
      when /[\+\-\*\/]/   # Operator
        operator = tokens.shift.to_sym # consume the token
      else
        raise "I don't understand #{expression.inspect}"
      end
    end
    accumulator
  end
end
