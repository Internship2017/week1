# Count how many times the letter a is repeated in the countries in the world

# Your code starts here

# letter_count = {}
#
# ('a'..'z').each{|l| letter_count[l] = 0}
#
# File.readlines('./support/countries.txt').each do |country|
#   country.split('').each { |c|
#     letter_count["#{c.downcase}"] = letter_count["#{c.downcase}"].to_i + 1
#   }
# end
#
# puts letter_count.inspect
# puts letter_count.sort.first
#
# # Your code ends here

puts File.read('./support/countries.txt').count('/[aA]')