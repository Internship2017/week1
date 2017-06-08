# Count how many times the letter a is repeated in the countries in the world

# Your code starts here
total_of_as = 0
File.readlines('./support/countries.txt').each do |country|
  total_of_as += number_of_as = country.scan(/a|A/).length
  # puts "Country: #{country} has #{number_of_as}"
end

# With Map Reduce
# puts File.readlines('./support/countries.txt').map { |country| country.scan(/a|A/).length }.reduce &:+

puts "The letter a is #{total_of_as} times in the countries in the world"
# Your code ends here
