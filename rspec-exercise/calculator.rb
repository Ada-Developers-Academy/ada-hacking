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
end
