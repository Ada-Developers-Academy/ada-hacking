# dirname = File.expand_path( File.dirname(__FILE__) )
# file_to_test = File.join( dirname, 'fizzbuzz.rb' )
# output = `ruby #{file_to_test}`
actual_output     = `ruby fizzbuzz.rb`
acceptable_output = File.read('acceptable_output.txt')

if actual_output == acceptable_output
  puts "YAAAAAAAY"
else
  puts "BOOOOOOOO"
end

