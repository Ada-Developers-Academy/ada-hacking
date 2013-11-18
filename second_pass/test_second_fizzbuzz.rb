require_relative 'fizzbuzz_function'

def assert(condition, failure_message)
  unless condition
    raise failure_message
  end
end

def assert_equality(expected, actual)
  failure_message = "FAILURE:  Expected #{expected.inspect}, but got #{actual.inspect}" 
  condition = (actual == expected)
  assert( condition, failure_message )
end

# Test 1
actual = fizzbuzz_of(1)
expected = 1
assert_equality expected, actual

# Test 2
actual = fizzbuzz_of(2)
expected = 2
assert_equality expected, actual

# Test 3
actual = fizzbuzz_of(3)
expected = 'Fizz'
assert_equality expected, actual

# If we got here, everything passed
puts "SUCCESS!"
