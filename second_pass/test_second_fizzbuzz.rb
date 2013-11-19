require_relative 'fizzbuzz_function'

def assert(condition, failure_message)
  unless condition
    puts failure_message
  end
end

def assert_equality(expected, actual)
  failure_message = "FAILURE:  Expected #{expected.inspect}, but got #{actual.inspect}" 
  condition = (actual == expected)
  assert( condition, failure_message )
end

# Test 1
assert_equality 1, fizzbuzz_of(1)

# Test 2
assert_equality 2, fizzbuzz_of(2)

# Test 3
assert_equality 'Fizz', fizzbuzz_of(3)

# If we got here, everything passed
puts "SUCCESS!"
