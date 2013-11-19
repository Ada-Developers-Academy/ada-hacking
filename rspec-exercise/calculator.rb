class Calculator
  def add(*numbers)
    numbers.flatten.inject(0, &:+)
  end
end
