require_relative 'fizzbuzz_function'

# Test 1
actual = fizzbuzz_of(1)
expected = 1
if actual != expected
  raise "FAILURE:  Expected 1, but got #{actual.inspect}"
end

# Test 2
actual = fizzbuzz_of(2)
expected = 2
if actual != expected
  raise "FAILURE:  Expected #{expected.inspect}, but got #{actual.inspect}"
end

# If we got here, everything passed
puts "SUCCESS!"
