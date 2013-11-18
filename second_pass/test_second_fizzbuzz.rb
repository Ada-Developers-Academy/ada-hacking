require_relative 'fizzbuzz_function'

def assert(condition, failure_message)
  unless condition
    raise failure_message
  end
end

# Test 1
actual = fizzbuzz_of(1)
expected = 1
condition = (actual == expected)
assert( condition, "FAILURE:  Expected #{expected.inspect}, but got #{actual.inspect}" )

# Test 2
actual = fizzbuzz_of(2)
expected = 2
assert( actual == expected, "FAILURE:  Expected #{expected.inspect}, but got #{actual.inspect}" )

# Test 3
actual = fizzbuzz_of(3)
expected = 'Fizz'
assert( actual == expected, "FAILURE:  Expected #{expected.inspect}, but got #{actual.inspect}" )

# If we got here, everything passed
puts "SUCCESS!"
