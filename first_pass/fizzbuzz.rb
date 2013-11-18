(1..100).each do |n|
  if (n % 15) == 0
    string = "FizzBuzz"
  elsif (n % 3) == 0
    string = "Fizz"
  elsif (n % 5) == 0
    string = "Buzz"
  else
    string = n
  end
  puts string
end
