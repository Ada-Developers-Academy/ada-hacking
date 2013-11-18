require_relative 'fizzbuzz_function'

actual = fizzbuzz_of(1)
expected = 1
if actual == expected
  puts "Success!"
else
  puts "FAILURE:  Expected 1, but got #{actual}"
end

