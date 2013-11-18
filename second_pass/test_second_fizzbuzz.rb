require_relative 'fizzbuzz_function'

actual = fizzbuzz_of(1)
expected = 1
if actual == expected
  puts "Success!"
else
  puts "FAILURE:  Expected 1, but got #{actual.inspect}"
end

actual = fizzbuzz_of(2)
expected = 2
if actual == expected
  puts "Success!"
else
  puts "FAILURE:  Expected #{expected.inspect}, but got #{actual.inspect}"
end

