# Write a script that gets the name and age of 3 people (name, age)
# Store them in an array of hashes named people e.g. {name: 'Adrian', age: 29}
# Strip trailing chars of input, look for the appropriate function here:
# http://ruby-doc.org/core-2.2.0/String.html

# Your script starts here

people = Array.new
peopleCount = 1..3
peopleCount.each do |personNumber|
	person = Hash.new
	puts "Give me the name of person #{personNumber}"
	person[:name] = gets.rstrip
	puts "Give me the age of person #{personNumber}"
	person[:age] = gets.to_i
	people.push(person)
end


# Your script ends here

puts people.inspect

# !! Bonus
# Store the age in the hash as an integer